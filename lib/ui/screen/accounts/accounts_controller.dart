//-------------------------------------------------------------------
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:isar/isar.dart';

import '../../../services/isar_database.dart';

//--Has Child
final hasChildProvider = StateProvider.autoDispose<bool>((ref) => false);

//--Accounts
final accountsProvider = StateNotifierProvider.autoDispose
    .family<AccountState, AsyncValue<List<AccountsModel>>, int>(
        (ref, parentId) {
  return AccountState(parentId: parentId);
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

  //--UPDATE
  Future<bool> update(
      {required int id,
      required String accountType,
      required Map<String, dynamic> formData}) async {
    try {
      switch (accountType) {
        case 'CASH': //--EXPENSES
          // await updateBankAccount(formData: formData, id: id);
          getAccounts(parentId);
          break;

        case 'EXPENDITURE': //--EXPENSES
          // await updateExpensesAccount(formData: formData, id: id);
          getAccounts(parentId);
          break;

        case 'INCOME': //--EXPENSES
          // await updateIncomeAccount(formData: formData, id: id);
          getAccounts(parentId);
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
