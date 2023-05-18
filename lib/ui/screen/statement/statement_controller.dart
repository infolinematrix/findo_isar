import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/services/isar_database.dart';
import 'package:isar/isar.dart';

import '../../../util/date_utils.dart';

//--START DATE
final startDateProvider = StateProvider((ref) {
  return firstDayOfMonth(DateTime.now());
});

//--END DATE
final endDateProvider = StateProvider((ref) {
  return lastDayOfMonth(DateTime.now());
});

//--ACCOUNT LIST
final accountsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final data = await IsarHelper.instance.db!.accountsModels
        .where()
        .statusEqualTo(51)
        .filter()
        .nameIsNotEmpty()
        .not()
        .group(
            (q) => q.accountTypeEqualTo('CASH').or().accountTypeEqualTo('BANK'))
        .and()
        .hasChildEqualTo(false)
        .findAll();
    return data;
  } catch (e) {
    rethrow;
  }
});

//--TRANSACTIONS
final transactionsProvider = FutureProvider.family((ref, int accountNo) async {
  try {
    final txns = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(ref.read(endDateProvider), ref.read(endDateProvider))
        .filter()
        .accountNoEqualTo(accountNo)
        .and()
        .statusEqualTo(51)
        .findAll();

    return txns;
  } catch (e) {
    rethrow;
  }
});
