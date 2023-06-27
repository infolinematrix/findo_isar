import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/scroll_model.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:isar/isar.dart';

import '../../../models/accounts_model.dart';
import '../../../services/isar_database.dart';
import '../../../util/date_utils.dart';

//--TXN MODE
final txnModeProvider = StateProvider.autoDispose<String>((ref) {
  return 'Cash';
});

//--SCROLL NO
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

//--SELECTABLE ACCOUNTS

final searchStringProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
//---------------
final selectableAccountsProvider =
    FutureProvider.family.autoDispose((ref, String accountType) async {
  List<AccountsModel>? accounts;
  try {
    final String sStr = ref.watch(searchStringProvider);

    switch (accountType) {
      case 'EXPENDITURE': //-- PAYMENT

        if (sStr != '') {
          accounts = await IsarHelper.instance.db!.accountsModels
              .filter()
              .statusEqualTo(51)
              // .and()
              // .accountTypeEqualTo(accountType)
              .not()
              .accountTypeEqualTo("INCOME")
              .and()
              .hasChildEqualTo(false)
              .and()
              .isSystemEqualTo(false)
              .and()
              .nameStartsWith(sStr, caseSensitive: false)
              .sortByName()
              .findAll();
        } else {
          accounts = await IsarHelper.instance.db!.accountsModels
              .filter()
              .statusEqualTo(51)
              // .and()
              // .accountTypeEqualTo(accountType)
              .not()
              .accountTypeEqualTo("INCOME")
              .and()
              .hasChildEqualTo(false)
              .and()
              .isSystemEqualTo(false)
              .sortByName()
              .findAll();
        }

        break;

      case 'INCOME': //-- RECEIVE

        if (sStr != '') {
          accounts = await IsarHelper.instance.db!.accountsModels
              .filter()
              .statusEqualTo(51)
              .and()
              .accountTypeEqualTo(accountType)
              .not()
              .accountTypeEqualTo("EXPENDITURE")
              .and()
              .hasChildEqualTo(false)
              .and()
              .isSystemEqualTo(false)
              .and()
              .nameStartsWith(sStr, caseSensitive: false)
              .findAll();
        } else {
          accounts = await IsarHelper.instance.db!.accountsModels
              .filter()
              .statusEqualTo(51)
              .and()
              .accountTypeEqualTo(accountType)
              .not()
              .accountTypeEqualTo("EXPENDITURE")
              .and()
              .hasChildEqualTo(false)
              .and()
              .isSystemEqualTo(false)
              .findAll();
        }

        break;
    }

    return accounts;
  } catch (e) {
    rethrow;
  }
});

//--ACCOUNT STATUS
final accountStatusOftheMonth =
    FutureProvider.family.autoDispose((ref, int accountNo) async {
  double totDr = 0;
  double totCr = 0;

  final txn = await IsarHelper.instance.db!.transactionsModels
      .where()
      .accountNoEqualTo(accountNo)
      .filter()
      .txnDateBetween(
          firstDayOfMonth(DateTime.now()), lastDayOfMonth(DateTime.now()))
      .statusEqualTo(51)
      .findAll();

  for (var txn in txn) {
    //--EXPENSES -- CASH DEBITING HERE
    if (txn.scrollType == ScrollType.HD) {
      totDr += txn.amount;
    }

    //--INCOME -- CASH CREDITING HERE
    if (txn.scrollType == ScrollType.HC) {
      totCr += txn.amount;
    }
  }

  return {'totalDr': totDr, 'totalCr': totCr};
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

//--EXPENDITURE ENTRY
final expenditureEntryProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    if (ref.read(txnModeProvider) != formData['txnMode']) {
      debugPrint("INVALID TXN MODE");
      return null;
    }

    //--Scroll No
    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;

    if (formData['txnMode'] == 'Cash') {
      //--Closing Balance (CASH)
      final cbal = await ref.watch(cashBalanceProvider.future);

      final txn = TransactionsModel()
        ..accountNo = formData['account']['accountNo'] //--CASH
        ..accountName = formData['account']['accountName'].toString().trim()
        ..txnType = TxnType.DR
        //--
        ..onAccount = 1
        ..onAccountName = 'CASH'
        ..onAccountCurrentBalance = cbal +
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..scrollType = ScrollType.HC
        //--
        ..txnDate = formData['data']['txnDate']

        //--
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = "Expenses by Cash"
        ..status = 51;

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

    if (formData['txnMode'] == 'Bank') {
      final bank = await IsarHelper.instance.db!.accountsModels
          .filter()
          .idEqualTo(formData['data']['bank'])
          .findFirst();

      final cbal = await ref.watch(bankBalanceProvider(bank!.id).future);

      final txn = TransactionsModel()
        ..accountNo = formData['account']['accountNo'] //--CASH
        ..accountName = formData['account']['accountName'].toString().trim()
        ..txnType = TxnType.DR
        //--
        ..onAccount = bank.id
        ..onAccountName = bank.name.toString().trim()
        ..onAccountCurrentBalance = cbal +
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..scrollType = ScrollType.HC
        //--
        ..txnDate = formData['data']['txnDate']
        //-

        //--
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = "Expenses by Cash"
        ..status = 51;

      final scrollUpdate = await IsarHelper.instance.db!.scrollModels
          .filter()
          .idEqualTo(1)
          .findFirst();
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
        await IsarHelper.instance.db!.scrollModels.put(
          scrollUpdate!..scrollNo = updatedScroll,
        );
      });
    }

    return true;
  } catch (e) {
    EasyLoading.dismiss();
    rethrow;
  }
});

//--INCOME ENTRY
final incomeEntryProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    if (ref.read(txnModeProvider) != formData['txnMode']) {
      debugPrint("INVALID TXN MODE");
      return null;
    }

    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;
    if (formData['txnMode'] == 'Cash') {
      final txn = TransactionsModel()
        ..txnDate = formData['data']['txnDate']
        ..scrollType = ScrollType.HD
        ..txnType = TxnType.CR
        ..accountNo = formData['account']['accountNo'] //--CASH
        ..accountName = formData['account']['accountName'].toString().trim()
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
    }

    if (formData['txnMode'] == 'Bank') {
      final bank = await IsarHelper.instance.db!.accountsModels
          .filter()
          .idEqualTo(formData['data']['bank'])
          .findFirst();
      final txn = TransactionsModel()
        ..txnDate = formData['data']['txnDate']
        ..scrollType = ScrollType.HD
        ..txnType = TxnType.CR
        ..accountNo = formData['account']['accountNo'] //--CASH
        ..accountName = formData['account']['accountName'].toString().trim()
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = "Paid.."
        ..narration = "To ${bank!.name.toString().trim()}"
        ..status = 51
        ..onAccount = bank.id
        ..onAccountName = bank.name.toString().trim();

      final scrollUpdate = await IsarHelper.instance.db!.scrollModels
          .filter()
          .idEqualTo(1)
          .findFirst();
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
        await IsarHelper.instance.db!.scrollModels.put(
          scrollUpdate!..scrollNo = updatedScroll,
        );
      });
    }

    return true;
  } catch (e) {
    EasyLoading.dismiss();
    rethrow;
  }
});

//--CASH WITHDRAWAL

final cashWithdrawalProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;

    final bank =
        await IsarHelper.instance.db!.accountsModels.get(formData['bank']);

    final txnTD = TransactionsModel()
      ..accountNo = 1 //--CASH
      ..accountName = 'CASH'
      ..txnType = TxnType.DR
      //--
      ..onAccount = bank!.id
      ..onAccountName = bank.name
      ..scrollType = ScrollType.TC
      //--
      ..txnDate = formData['txnDate']
      //--
      ..scrollNo = updatedScroll
      ..scrollSlNo = 1
      ..amount = double.parse(formData['amount'].toString()).toDouble()
      ..description = formData['description'].toString().trim()
      ..narration = "Cash Withdrawal"
      ..status = 51;

    final txnTC = TransactionsModel()
      ..accountNo = bank.id //--CASH
      ..accountName = bank.name
      ..txnType = TxnType.CR
      //--
      ..onAccount = 1
      ..onAccountName = 'CASH'
      ..scrollType = ScrollType.TD
      //--
      ..txnDate = formData['txnDate']
      //--
      ..scrollNo = updatedScroll
      ..scrollSlNo = 2
      ..amount = double.parse(formData['amount'].toString()).toDouble()
      ..description = formData['description'].toString().trim()
      ..narration = "Cash Withdrawal"
      ..status = 51;

    final scrollUpdate = await IsarHelper.instance.db!.scrollModels
        .filter()
        .idEqualTo(1)
        .findFirst();

    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db?.transactionsModels.putAll([txnTC, txnTD]);
      await IsarHelper.instance.db!.scrollModels.put(
        scrollUpdate!..scrollNo = updatedScroll,
      );
    });
  } catch (e) {
    rethrow;
  }
});

//--CASH DEPOSIT

final cashDepositProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;

    final bank =
        await IsarHelper.instance.db!.accountsModels.get(formData['bank']);

    final txn = TransactionsModel()
      ..txnDate = formData['txnDate']
      ..scrollType = ScrollType.TD
      ..txnType = TxnType.CR
      ..accountNo = formData['bank'] //--CASH
      ..accountName = bank!.name
      ..scrollNo = updatedScroll
      ..scrollSlNo = 1
      ..amount = double.parse(formData['amount'].toString()).toDouble()
      ..description = formData['description'].toString().trim()
      ..narration = "Cash Withdrawal"
      ..status = 51
      ..onAccount = 1
      ..onAccountName = 'CASH';

    final scrollUpdate = await IsarHelper.instance.db!.scrollModels
        .filter()
        .idEqualTo(1)
        .findFirst();
    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db?.transactionsModels.putAll([txn]);
      await IsarHelper.instance.db!.scrollModels.put(
        scrollUpdate!..scrollNo = updatedScroll,
      );
    });
  } catch (e) {
    rethrow;
  }
});

//--DELETE TXN

final deleteTxnProvider = FutureProvider.family((ref, int txnId) async {
  try {
    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db!.transactionsModels.delete(txnId);
    });
    return true;
  } catch (e) {
    rethrow;
  }
});

//--CLOCING BALANCE - CASH

final cashBalanceProvider = FutureProvider.autoDispose((ref) async {
  final txn = await IsarHelper.instance.db!.transactionsModels
      .filter()
      .onAccountEqualTo(1)
      .sortByCreatedAtDesc()
      .findFirst();

  if (txn == null) {
    final ac = await IsarHelper.instance.db!.accountsModels
        .where()
        .idEqualTo(1)
        .findFirst();

    return ac!.openingBalance;
  }

  return txn.onAccountCurrentBalance;
});

//--CLOSING BALANCE - BANK
final bankBalanceProvider = FutureProvider.family((ref, int bankId) async {
  final txn = await IsarHelper.instance.db!.transactionsModels
      .filter()
      .onAccountEqualTo(bankId)
      .sortByCreatedAtDesc()
      .findFirst();

  if (txn == null) {
    final ac = await IsarHelper.instance.db!.accountsModels
        .where()
        .idEqualTo(bankId)
        .findFirst();

    return ac!.openingBalance;
  }

  return txn.onAccountCurrentBalance;
});
