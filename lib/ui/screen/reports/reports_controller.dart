//-- BANK BOOK
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/services/isar_database.dart';
import 'package:isar/isar.dart';

import '../../../util/date_utils.dart';

//-- SELECTED ACCOUNT
final selectedAccount = StateProvider.autoDispose<int>((ref) {
  return 0;
});

//--START DATE
final startDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return dayStart(firstDayOfMonth(DateTime.now()));
});

//--END DATE
final endDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return dayEnd(lastDayOfMonth(DateTime.now()));
});

//--BANK ACOOUNT PROVIDER
final bankAccountsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final banks = await IsarHelper.instance.db!.accountsModels
        .filter()
        .accountTypeEqualTo('BANK')
        .and()
        .statusEqualTo(51)
        .and()
        .hasChildEqualTo(false)
        .not()
        .parentEqualTo(0)
        .findAll();

    return banks;
  } catch (e) {
    rethrow;
  }
});

//--BANK BOOK
final bankBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final accountNo = ref.watch(selectedAccount);
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final data = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .group(
          (q) => q.statusEqualTo(51).and().onAccountEqualTo(accountNo),
        )
        .sortByTxnDateDesc()
        .findAll();
    return data;
  } catch (e) {
    rethrow;
  }
});

//--PAYMENT BOOK
final paymentBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final data = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .group((q) => q
            .statusEqualTo(51)
            .and()
            .scrollTypeEqualTo(ScrollType.hc)
            .or()
            .scrollTypeEqualTo(ScrollType.bc))
        .sortByTxnDateDesc()
        .findAll();
    return data;
  } catch (e) {
    rethrow;
  }
});

//--PAYMENT BOOK
final receivedBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final data = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .statusEqualTo(51)
        .and()
        .scrollTypeEqualTo(ScrollType.hd)
        .sortByTxnDateDesc()
        .findAll();
    return data;
  } catch (e) {
    rethrow;
  }
});

//--CASH BOOK
final cashBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final data = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .group(
          (q) => q.statusEqualTo(51).and().onAccountEqualTo(1),
        )
        .sortByTxnDateDesc()
        .findAll();
    return data;
  } catch (e) {
    rethrow;
  }
});

//--ACCOUNTS SUMMARY
final accountsSummaryProvider = FutureProvider.autoDispose((ref) async {
  try {
    final startDate = ref.watch(startDateProvider);
    final endDate = dayEnd(ref.watch(endDateProvider));

    final accounts = await IsarHelper.instance.db!.accountsModels
        .where()
        .statusEqualTo(51)
        .filter()
        .hasChildEqualTo(false)
        .not()
        .accountTypeEqualTo('CASH')
        .not()
        .accountTypeEqualTo('BANK')
        .sortByName()
        .findAll();

    List<Map<String, dynamic>> data = [];

    for (var account in accounts) {
      final txns = await IsarHelper.instance.db!.transactionsModels
          .where()
          .accountNoEqualTo(account.id)
          .filter()
          .txnDateBetween(startDate, endDate)
          .and()
          .statusEqualTo(51)
          .findAll();

      double totalDr = 0.00, totalCr = 0.00, total = 0.00;

      for (var txn in txns) {
        if (txn.scrollType == ScrollType.hc ||
            txn.scrollType == ScrollType.bc) {
          totalDr += txn.amount;
        } else if (txn.scrollType == ScrollType.hd ||
            txn.scrollType == ScrollType.bd) {
          totalCr += txn.amount;
        }
      }

      total = totalCr - totalDr;
      if (total != 0) {
        data.addAll([
          {
            'account': account.name.toString().capitalize,
            'account_description': account.description != null
                ? account.description.toString().capitalize
                : 'No description found',
            'account_budget': account.budget,
            'total_debit': totalDr,
            'total_credit': totalCr,
            'total': total < 0 ? total.abs() : total
          }
        ]);
      }
    }

    return data;
  } catch (e) {
    rethrow;
  }
});
