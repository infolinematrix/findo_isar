import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../app/services/isar_database.dart';
import '../../../data/models/accounts_model.dart';

final hasChildProvider = StateProvider.autoDispose<bool>((ref) => false);
final hasBudget = StateProvider.autoDispose<bool>((ref) => false);
final hasOpeningBanlance = StateProvider.autoDispose<bool>((ref) => false);

//-------------------------------------------------------------------
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
        case 'CASH': //--BANK
          await createBankAccount(formData: formData, parentId: parent.id);
          getAccounts(parentId);
          break;

        case 'INCOME': //--Income Account
          await createIncomeAccount(formData: formData, parent: parent);
          getAccounts(parentId);
          break;

        case 'EXPENDITURE': //--Expenses Account
          await createExpensesAccount(formData: formData, parent: parent);
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
          await updateBankAccount(formData: formData, id: id);
          getAccounts(parentId);
          break;

        case 'EXPENDITURE': //--EXPENSES
          await updateExpensesAccount(formData: formData, id: id);
          getAccounts(parentId);
          break;

        case 'INCOME': //--EXPENSES
          await updateIncomeAccount(formData: formData, id: id);
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

Future<bool> updateExpensesAccount(
    {required Map<String, dynamic> formData, required int id}) async {
  try {
    await IsarHelper.instance.db!.writeTxn(() async {
      final account = await IsarHelper.instance.db!.accountsModels.get(id);
      account!.name = formData['name'].toString().trim();
      account.openingBalance =
          double.parse(formData['openingBalance'].toString()).toDouble();
      account.budget = double.parse(formData['budget'].toString()).toDouble();
      account.description = formData['description'].toString().trim();

      // account.hd = formData['allowPayment'] as bool;
      // account.hc = formData['allowReceipt'] as bool;
      // account.td = formData['allowTransferDebit'] as bool;
      // account.tc = formData['allowTransferCredit'] as bool;

      await IsarHelper.instance.db!.accountsModels.put(account);
    });
    return true;
  } catch (e) {
    rethrow;
  }
}

Future<bool> updateBankAccount(
    {required Map<String, dynamic> formData, required int id}) async {
  try {
    await IsarHelper.instance.db!.writeTxn(() async {
      final account = await IsarHelper.instance.db!.accountsModels.get(id);
      account!.name = formData['name'].toString().trim();
      account.bankAccountNo =
          int.parse(formData['bankAccountNo'].toString()).toInt();
      account.openingBalance =
          double.parse(formData['openingBalance'].toString()).toDouble();
      account.status = formData['isActive'] == true ? 51 : 0;

      await IsarHelper.instance.db!.accountsModels.put(account);
    });
    return true;
  } catch (e) {
    rethrow;
  }
}

Future<bool> updateIncomeAccount(
    {required Map<String, dynamic> formData, required int id}) async {
  try {
    return true;
  } catch (e) {
    rethrow;
  }
}

//--CREATE INCOME ACCOUNT
Future createIncomeAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parent}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parent.accountType
        ..bankAccountNo = 0
        ..budget = double.parse(formData['budget'] ?? 0.toString()).toDouble()
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        ..openingBalance =
            double.parse(formData['openingBalance'] ?? 0.toString()).toDouble()
        ..isSystem = false
        ..parent = parent.id
        ..description = formData['description'].toString().trim()
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

//--CREATE EXPENSES ACCOUNT
Future createExpensesAccount(
    {required Map<String, dynamic> formData,
    required AccountsModel parent}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = parent.accountType
        ..budget = double.parse(formData['budget'] ?? 0.toString()).toDouble()
        ..name = formData['name'].toString().trim()
        ..hasChild = formData['hasChild'] as bool
        ..openingBalance =
            double.parse(formData['openingBalance'] ?? 0.toString()).toDouble()
        ..parent = parent.id
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
    {required Map<String, dynamic> formData, required int parentId}) async {
  try {
    final accountExist = await IsarHelper.instance.db!.accountsModels
        .filter()
        .nameEqualTo(formData['name'].toString().trim())
        .count();

    if (accountExist == 0) {
      int status = formData['isActive'] == true ? 51 : 0;

      final account = AccountsModel()
        ..accountType = "CASH"
        ..bankAccountNo =
            int.parse(formData['bankAccountNo'].toString()).toInt()
        ..name = formData['name'].toString().trim()
        ..hasChild = false
        ..openingBalance =
            double.parse(formData['openingBalance'].toString()).toDouble()
        ..isSystem = false
        ..parent = parentId
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

final getAccountProvider =
    FutureProvider.family.autoDispose((ref, int id) async {
  try {
    final account = await IsarHelper.instance.db!.accountsModels
        .filter()
        .idEqualTo(id)
        .findFirst();

    return account!;
  } catch (e) {
    rethrow;
  }
});
