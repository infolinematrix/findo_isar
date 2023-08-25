import 'package:findo_isar/data/models/accounts_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../app/services/isar_database.dart';
import '../../../data/models/scroll_model.dart';
import '../../../data/models/transactions_model.dart';

final txnModeProvider = StateProvider.autoDispose<String>((ref) {
  return 'Cash';
});

final txnAccountsProvider =
    FutureProvider.family.autoDispose((ref, String txnType) async {
  List<AccountsModel>? accounts;
  try {
    switch (txnType) {
      case 'EXPENDITURE': //-- PAYMENT
        accounts = await IsarHelper.instance.db!.accountsModels
            .filter()
            .statusEqualTo(51)
            .and()
            .accountTypeEqualTo(txnType)
            .and()
            .hasChildEqualTo(false)
            .and()
            .isSystemEqualTo(false)
            .findAll();

        break;

      case 'INCOME': //-- RECEIVE
        accounts = await IsarHelper.instance.db!.accountsModels
            .filter()
            .statusEqualTo(51)
            .and()
            .accountTypeEqualTo(txnType)
            .and()
            .hasChildEqualTo(false)
            .and()
            .isSystemEqualTo(false)
            .findAll();
        break;
    }

    return accounts;
  } catch (e) {
    rethrow;
  }
});

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

final receiveTransactionProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;
    if (formData['txnMode'] == 'Cash') {
      final txn = TransactionsModel()
        ..txnDate = formData['data']['txnDate']
        ..scrollType = ScrollType.HD
        ..txnType = TxnType.CR
        ..accountNo = 1 //--CASH
        ..accountName = 'CASH'
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = "Cash"
        ..narration = formData['account']['accountName'].toString().trim()
        ..status = 51
        ..onAccount = 1
        ..onAccountName = 'CASH';

      final scrollUpdate = await IsarHelper.instance.db!.scrollModels
          .filter()
          .idEqualTo(1)
          .findFirst();
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
        await IsarHelper.instance.db!.scrollModels
            .put(scrollUpdate!..scrollNo = updatedScroll);
      });
    } else {
      final bank = await IsarHelper.instance.db!.accountsModels
          .filter()
          .idEqualTo(formData['data']['bank'])
          .findFirst();

      final txn = TransactionsModel()
        // ..txnMode = TxnMode.INCOME
        ..txnDate = formData['data']['txnDate']
        ..scrollType = ScrollType.HD
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..txnType = TxnType.DR
        ..accountNo =
            int.parse(formData['account']['accountNo'].toString()).toInt()
        ..accountName = formData['account']['accountName'].toString().trim()
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = bank!.name.toString().trim()
        ..status = 51
        ..onAccount = bank.id
        ..onAccountName = bank.name;

      final scrollUpdate = await IsarHelper.instance.db!.scrollModels
          .filter()
          .idEqualTo(1)
          .findFirst();
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
        await IsarHelper.instance.db!.scrollModels
            .put(scrollUpdate!..scrollNo = updatedScroll);
      });
    }

    return true;
  } catch (e) {
    rethrow;
  }
});

//--PAYMENT
final paymentTransactionProvider = FutureProvider.family.autoDispose(
  (ref, Map<String, dynamic> formData) async {
    try {
      final updatedScroll =
          await ref.watch(getScrollNoProvider.future).then((value) => value) +
              1;
      if (formData['txnMode'].toString().trim() == 'Cash') {
        final txn = TransactionsModel()
          ..txnDate = formData['data']['txnDate']
          ..scrollType = ScrollType.HC
          ..txnType = TxnType.DR
          ..accountNo =
              int.parse(formData['account']['accountNo'].toString()).toInt()
          ..accountName = formData['account']['accountName'].toString().trim()
          ..scrollNo = updatedScroll
          ..scrollSlNo = 1
          ..amount =
              double.parse(formData['data']['amount'].toString()).toDouble()
          ..description = formData['data']['description'].toString().trim()
          ..narration = "Cash"
          ..status = 51
          ..onAccount = 1
          ..onAccountName = 'CASH';

        final scrollUpdate = await IsarHelper.instance.db!.scrollModels
            .filter()
            .idEqualTo(1)
            .findFirst();
        await IsarHelper.instance.db!.writeTxn(() async {
          await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
          await IsarHelper.instance.db!.scrollModels
              .put(scrollUpdate!..scrollNo = updatedScroll);
        });
      } else {
        final bank = await IsarHelper.instance.db!.accountsModels
            .filter()
            .idEqualTo(formData['data']['bank'])
            .findFirst();

        final txn = TransactionsModel()
          ..txnDate = formData['data']['txnDate']
          ..scrollType = ScrollType.HC
          ..txnType = TxnType.DR
          ..accountNo =
              int.parse(formData['account']['accountNo'].toString()).toInt()
          ..accountName = formData['account']['accountName'].toString().trim()
          ..scrollNo = updatedScroll
          ..scrollSlNo = 1
          ..amount =
              double.parse(formData['data']['amount'].toString()).toDouble()
          ..description = formData['data']['description'].toString().trim()
          ..narration = bank!.name.toString().trim()
          ..status = 51
          ..onAccount = bank.id
          ..onAccountName = bank.name;

        final scrollUpdate = await IsarHelper.instance.db!.scrollModels
            .filter()
            .idEqualTo(1)
            .findFirst();
        await IsarHelper.instance.db!.writeTxn(() async {
          await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
          await IsarHelper.instance.db!.scrollModels
              .put(scrollUpdate!..scrollNo = updatedScroll);
        });
      }

      return true;
    } catch (e) {
      rethrow;
    }
  },
);

//--Scroll
final getScrollNoProvider = FutureProvider.autoDispose<int>((ref) async {
  try {
    final scroll = await IsarHelper.instance.db!.scrollModels.count();

    if (scroll == 0) return 0;

    final cCcroll = await IsarHelper.instance.db!.scrollModels.get(1);
    return cCcroll!.scrollNo;
  } catch (e) {
    return 0;
  }
});

//Txn Detail
final txnDetailProvider =
    FutureProvider.family.autoDispose((ref, int scrollNo) async {
  try {
    // final txns = IsarHelper.instance.db!.transactionsModels.filter()
    //   ..scrollNoEqualTo(scrollNo).findAll();

    final txns = await IsarHelper.instance.db!.transactionsModels
        .filter()
        .scrollNoEqualTo(scrollNo)
        .findAll();

    return txns;
  } catch (e) {
    rethrow;
  }
});
