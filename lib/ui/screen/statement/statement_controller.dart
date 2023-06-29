import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/services/isar_database.dart';
import 'package:isar/isar.dart';

import '../../../util/date_utils.dart';

//--START DATE
final startDateProvider = StateProvider.autoDispose((ref) {
  return firstDayOfMonth(DateTime.now());
});

//--END DATE
final endDateProvider = StateProvider.autoDispose((ref) {
  return lastDayOfMonth(DateTime.now());
});

//--SEARCH STRING ACCOUNT
final searchStringProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

//--TOTAL DR/CR
final totalDebitProvider = StateProvider.autoDispose<double>((ref) {
  return 0.00;
});
final totalCreditProvider = StateProvider.autoDispose<double>((ref) {
  return 0.00;
});

//--ACCOUNT LIST
final accountsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final String sStr = ref.watch(searchStringProvider);

    if (sStr != '') {
      final data = await IsarHelper.instance.db!.accountsModels
          .where()
          .statusEqualTo(51)
          .filter()
          .nameIsNotEmpty()
          .not()
          .group((q) =>
              q.accountTypeEqualTo('CASH').or().accountTypeEqualTo('BANK'))
          .and()
          .hasChildEqualTo(false)
          .and()
          .nameStartsWith(sStr, caseSensitive: false)
          .sortByName()
          .findAll();

      return data;
    } else {
      final data = await IsarHelper.instance.db!.accountsModels
          .where()
          .statusEqualTo(51)
          .filter()
          .nameIsNotEmpty()
          .not()
          .group((q) =>
              q.accountTypeEqualTo('CASH').or().accountTypeEqualTo('BANK'))
          .and()
          .hasChildEqualTo(false)
          .sortByName()
          .findAll();

      return data;
    }
  } catch (e) {
    rethrow;
  }
});

//--TRANSACTIONS
final transactionsProvider =
    FutureProvider.family.autoDispose((ref, int accountNo) async {
  try {
    final startDate = ref.watch(startDateProvider);
    final endDate = dayEnd(ref.watch(endDateProvider));

    double totalDr = 0.00;
    double totalCr = 0.00;

    final txns = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(startDate, endDate)
        .filter()
        .accountNoEqualTo(accountNo)
        .and()
        .statusEqualTo(51)
        .sortByTxnDateDesc()
        .findAll();

    for (var txn in txns) {
      if (txn.txnType == TxnType.DR) {
        totalDr += txn.amount;
      }

      if (txn.txnType == TxnType.CR) {
        totalCr += txn.amount;
      }
    }

    ref.watch(totalCreditProvider.notifier).update((state) => totalCr);
    ref.watch(totalDebitProvider.notifier).update((state) => totalDr);

    return txns;
  } catch (e) {
    rethrow;
  }
});
