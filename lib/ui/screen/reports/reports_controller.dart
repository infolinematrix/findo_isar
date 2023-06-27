//-- BANK BOOK
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
  return firstDayOfMonth(DateTime.now());
});

//--END DATE
final endDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return lastDayOfMonth(DateTime.now());
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
    final accountNo = ref.read(selectedAccount);
    final sDate = ref.read(startDateProvider);
    final eDate = ref.read(endDateProvider);

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

//--CASH BOOK
final cashBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.read(startDateProvider);
    final eDate = ref.read(endDateProvider);

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
