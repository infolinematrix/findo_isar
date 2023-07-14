//-------------------------------------------------------------------
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/accounts_model.dart';

import 'package:isar/isar.dart';

import '../../../services/isar_database.dart';

//--Has Child
final hasChildProvider = StateProvider.autoDispose<bool>((ref) => false);

//--SEARCH STRING ACCOUNT
final searchStringProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

//--Account Async Notifier
final childAccountsProvider = AsyncNotifierProvider.family
    .autoDispose<ChildAccountsNotifier, List<AccountsModel>, int>(() {
  return ChildAccountsNotifier();
});

class ChildAccountsNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<AccountsModel>, int> {
  @override
  FutureOr<List<AccountsModel>> build(int arg) async {
    return await getAccounts();
  }

  getAccounts() async {
    final String sStr = ref.watch(searchStringProvider);

    if (sStr != '') {
      final data = await IsarHelper.instance.db!.accountsModels
          .filter()
          .parentEqualTo(arg)
          .and()
          .idGreaterThan(1)
          .and()
          .nameIsNotEmpty()
          .and()
          .nameStartsWith(sStr, caseSensitive: false)
          .sortByName()
          .findAll();

      return data;
    } else {
      final data = await IsarHelper.instance.db!.accountsModels
          .filter()
          .parentEqualTo(arg)
          .and()
          .idGreaterThan(1)
          .and()
          .nameIsNotEmpty()
          .sortByName()
          .findAll();

      return data;
    }
  }

  //--CREATE
  Future<bool> create(
      {required AccountsModel parent,
      required Map<String, dynamic> formData}) async {
    try {
      switch (parent.accountType) {
        case 'BANK': //--BANK
          await createBankAccount(formData: formData, parentAccount: parent);
          ref.invalidate(childAccountsProvider(arg));
          break;

        case 'INCOME': //--Income Account
          await createIncomeAccount(formData: formData, parentAccount: parent);
          ref.invalidate(childAccountsProvider(arg));
          break;

        case 'EXPENDITURE': //--Expenses Account
          await createExpensesAccount(
              formData: formData, parentAccount: parent);
          ref.invalidate(childAccountsProvider(arg));
          break;

        case 'LIABILITIES': //--Expenses Account
          await createLiabilitiesAccount(
              formData: formData, parentAccount: parent);
          ref.invalidate(childAccountsProvider(arg));
          break;
      }
      return true;
    } catch (e) {
      EasyLoading.dismiss();
      rethrow;
    }
  }

  //--DELETE ACCOUNT
  Future<bool> delete({required int id}) async {
    try {
      final childCount = await IsarHelper.instance.db!.accountsModels
          .where()
          .parentEqualTo(id)
          .count();
      if (childCount > 0) {
        EasyLoading.showToast("Can't Delete, Child account exist");
        return false;
      }
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.delete(id);
        EasyLoading.showToast("Deleted");
        ref.invalidate(childAccountsProvider(arg));
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }
}

//---Root Account
final rootAccountsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final data = await IsarHelper.instance.db!.accountsModels
        .where()
        .parentEqualTo(0)
        .filter()
        .statusEqualTo(51)
        .and()
        .nameIsNotEmpty()
        .sortByName()
        .findAll();

    return data;
  } catch (e) {
    rethrow;
  }
});

//--Accounts
final accountsProvider = StateNotifierProvider.autoDispose
    .family<AccountState, AsyncValue<List<AccountsModel>>, int>(
        (ref, parentId) {
  return AccountState(
    parentId: parentId,
  );
});

class AccountState extends StateNotifier<AsyncValue<List<AccountsModel>>> {
  final int parentId;
  AccountState({required this.parentId})
      : super(const AsyncValue<List<AccountsModel>>.loading()) {
    getAccounts(parentId);
  }

  //---GET ALL
  getAccounts(int parentId) async {
    final data = await IsarHelper.instance.db!.accountsModels
        .filter()
        .parentEqualTo(parentId)
        .idGreaterThan(1)
        .nameIsNotEmpty()
        .sortByName()
        .findAll();

    state = AsyncValue<List<AccountsModel>>.data(data);
  }

  //--CREATE
  Future<bool> create(
      {required AccountsModel parent,
      required Map<String, dynamic> formData}) async {
    try {
      switch (parent.accountType) {
        case 'BANK': //--BANK
          await createBankAccount(formData: formData, parentAccount: parent);
          getAccounts(parentId);
          break;

        case 'INCOME': //--Income Account
          await createIncomeAccount(formData: formData, parentAccount: parent);
          getAccounts(parentId);
          break;

        case 'EXPENDITURE': //--Expenses Account
          await createExpensesAccount(
              formData: formData, parentAccount: parent);
          getAccounts(parentId);
          break;

        case 'LIABILITIES': //--Expenses Account
          await createLiabilitiesAccount(
              formData: formData, parentAccount: parent);
          getAccounts(parentId);
          break;
      }
      return true;
    } catch (e) {
      EasyLoading.dismiss();
      rethrow;
    }
  }

  //--UPDATE ACCOUNT
  Future<bool> update({required Map<String, dynamic> formData}) async {
    try {
      final AccountsModel account = formData['account'];
      switch (account.accountType) {
        case 'BANK': //--BANK

          await updateBankAccount(
            formData: formData['data'],
            account: account,
          );
          break;

        case 'INCOME': //--BANK
          await updateIncomeAccount(
            formData: formData['data'],
            account: account,
          );
          break;

        case 'EXPENDITURE': //--BANK
          await updateExpensesAccount(
            formData: formData['data'],
            account: account,
          );
          break;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  //--DELETE ACCOUNT
  Future<bool> delete({required int id}) async {
    try {
      final childCount = await IsarHelper.instance.db!.accountsModels
          .filter()
          .parentEqualTo(id)
          .count();
      if (childCount > 0) {
        EasyLoading.showToast("Can't Delete, Child account exist");
        return false;
      }
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.delete(id);
        EasyLoading.showToast("Deleted");
        getAccounts(parentId);
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }
}

//--CREATE EXPENSES ACCOUNT
Future createIncomeAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parentAccount}) async {
  try {
    EasyLoading.show(indicator: const CircularProgressIndicator());

    final accountExist = await IsarHelper.instance.db!.accountsModels
        .where()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parentAccount.accountType
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        // ..openingBalance =
        //     double.parse(formData['openingBalance'] ?? 0.toString()).toDouble()
        ..parent = parentAccount.id
        ..description = formData['description'].toString().trim()
        ..status = status
        ..isSystem = false;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.put(account);
      });
    } else {
      EasyLoading.showToast("Account already exist!");
    }
  } catch (e) {
    rethrow;
  }
}

//--CREATE EXPENSES ACCOUNT
Future createExpensesAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parentAccount}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parentAccount.accountType
        ..budget = double.parse(formData['budget'] ?? 0.toString()).toDouble()
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        // ..openingBalance =
        //     double.parse(formData['openingBalance'] ?? 0.toString()).toDouble()
        ..parent = parentAccount.id
        ..description = formData['description'].toString().trim()
        ..status = status
        ..isSystem = false;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.put(account);
      });
    } else {
      EasyLoading.showToast("Account already exist!");
    }
  } catch (e) {
    rethrow;
  }
}

//--CREATE BANK ACCOUNT
Future createBankAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parentAccount}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parentAccount.accountType
        ..bankAccountNo =
            int.parse(formData['bankAccountNo'].toString()).toInt()
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        ..openingBalance =
            double.parse(formData['openingBalance'].toString()).toDouble()
        ..isSystem = false
        ..parent = parentAccount.id
        ..status = status;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.put(account);
      });
    } else {
      EasyLoading.showToast("Account already exist!");
    }
  } catch (e) {
    rethrow;
  }
}

//--CREATE LIABILITIES ACCOUNT
Future createLiabilitiesAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parentAccount}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parentAccount.accountType
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        ..openingBalance =
            double.parse(formData['openingBalance'].toString()).toDouble()
        ..isSystem = false
        ..parent = parentAccount.id
        ..status = status;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.accountsModels.put(account);
      });
    } else {
      EasyLoading.showToast("Account already exist!");
    }
  } catch (e) {
    rethrow;
  }
}

//--UPDATE BANK ACCOUNT
Future updateBankAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel account}) async {
  try {
    account.name = formData['name'];
    account.description = formData['description'];
    account.bankAccountNo = int.parse(formData['bankAccountNo']).toInt();
    account.openingBalance =
        double.parse(formData['openingBalance']).toDouble();
    account.status = formData['isActive'] == true ? 51 : 0;

    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db!.accountsModels.put(account);
    });
  } catch (e) {
    rethrow;
  }
}

//--UPDATE INCOME ACCOUNT
Future updateIncomeAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel account}) async {
  try {
    account.name = formData['name'];
    account.description = formData['description'];
    account.status = formData['isActive'] == true ? 51 : 0;

    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db!.accountsModels.put(account);
    });
  } catch (e) {
    rethrow;
  }
}

//--UPDATE EXPENSES ACCOUNT
Future updateExpensesAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel account}) async {
  try {
    account.name = formData['name'];
    account.description = formData['description'];
    account.budget = double.parse(formData['budget']).toDouble();
    account.status = formData['isActive'] == true ? 51 : 0;

    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db!.accountsModels.put(account);
    });
  } catch (e) {
    rethrow;
  }
}
