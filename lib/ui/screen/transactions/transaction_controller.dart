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

//--SELECTABLE ACCOUNTS
final selectableAccountsProvider =
    FutureProvider.family.autoDispose((ref, String accountType) async {
  List<AccountsModel>? accounts;
  try {
    switch (accountType) {
      case 'EXPENDITURE': //-- PAYMENT
        accounts = await IsarHelper.instance.db!.accountsModels
            .filter()
            .statusEqualTo(51)
            .and()
            .accountTypeEqualTo(accountType)
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
            .accountTypeEqualTo(accountType)
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

    final updatedScroll =
        await ref.watch(getScrollNoProvider.future).then((value) => value) + 1;
    if (formData['txnMode'] == 'Cash') {
      final txn = TransactionsModel()
        ..txnDate = formData['data']['txnDate']
        ..scrollType = ScrollType.HC
        ..txnType = TxnType.DR
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
        ..scrollType = ScrollType.HC
        ..txnType = TxnType.DR
        ..accountNo = formData['account']['accountNo'] //--CASH
        ..accountName = formData['account']['accountName'].toString().trim()
        ..scrollNo = updatedScroll
        ..scrollSlNo = 1
        ..amount =
            double.parse(formData['data']['amount'].toString()).toDouble()
        ..description = formData['data']['description'].toString().trim()
        ..narration = "Paid.."
        ..narration = "By ${bank!.name.toString().trim()}"
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
