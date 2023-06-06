import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/services/isar_database.dart';
import 'package:isar/isar.dart';

final accountsProvider = FutureProvider.autoDispose((ref) async {
  final accounts = await IsarHelper.instance.db!.accountsModels
      .where()
      .statusEqualTo(51)
      .filter()
      .accountTypeEqualTo('CASH')
      .or()
      .accountTypeEqualTo('BANK')
      .and()
      .hasChildEqualTo(false)
      .findAll();

  return accounts;
});

//--Selected
final selectedAccountProvider = StateProvider.autoDispose((ref) {
  return 0;
});

final getAccountDataProvider = FutureProvider.autoDispose((ref) async {
  final acctId = ref.watch(selectedAccountProvider);
  final account = await IsarHelper.instance.db!.accountsModels.get(acctId);
  final txnCount = await IsarHelper.instance.db!.transactionsModels
      .where()
      .onAccountEqualTo(acctId)
      .filter()
      .statusEqualTo(51)
      .sortByCreatedAtDesc()
      .findAll();

  if (acctId != 0) {
    final data = {
      'id': account!.id,
      'name': account.name,
      'openingBalance': account.openingBalance,
      'txnCount': txnCount.length,
      'currentBalance':
          txnCount.isNotEmpty ? txnCount.first.onAccountCurrentBalance : 0.00
    };

    return data;
  }

  return null;
});

//-- RE CALCULATE
final calculateProvider = FutureProvider.autoDispose((ref) async {
  try {
    final acctId = ref.watch(selectedAccountProvider);
    final account = await IsarHelper.instance.db!.accountsModels.get(acctId);
    final txns = await IsarHelper.instance.db!.transactionsModels
        .where()
        .onAccountEqualTo(acctId)
        .filter()
        .statusEqualTo(51)
        .sortByScrollSlNo()
        .findAll();

    for (var i = 0; i < txns.length; i++) {
      if (i == 0) {
        final txn = txns[i];
        if (txn.scrollType == ScrollType.HD ||
            txn.scrollType == ScrollType.TD) {
          final cbal = account!.openingBalance - txn.amount;
          txn.onAccountCurrentBalance = cbal;
          await IsarHelper.instance.db!.writeTxn(() async {
            await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
          });
        }
        if (txn.scrollType == ScrollType.HC ||
            txn.scrollType == ScrollType.TC) {
          final cbal = account!.openingBalance + txn.amount;
          txn.onAccountCurrentBalance = cbal;
          await IsarHelper.instance.db!.writeTxn(() async {
            await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
          });
        }
      } else {
        TransactionsModel txnC = txns[i - 1];
        if (txns[i].scrollType == ScrollType.HD ||
            txns[i].scrollType == ScrollType.TD) {
          final cbal = txnC.onAccountCurrentBalance - txns[i].amount;
          txns[i].onAccountCurrentBalance = cbal;
          await IsarHelper.instance.db!.writeTxn(() async {
            await IsarHelper.instance.db?.transactionsModels.putAll([txns[i]]);
          });
        }
        if (txns[i].scrollType == ScrollType.HC ||
            txns[i].scrollType == ScrollType.TC) {
          final cbal = txnC.onAccountCurrentBalance + txns[i].amount;
          txns[i].onAccountCurrentBalance = cbal;
          await IsarHelper.instance.db!.writeTxn(() async {
            await IsarHelper.instance.db?.transactionsModels.putAll([txns[i]]);
          });
        }
      }
    }
    return true;
  } catch (e) {
    rethrow;
  }
});
