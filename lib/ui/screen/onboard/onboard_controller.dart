import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/scroll_model.dart';
import 'package:flutter_wallet/models/settings_model.dart';
import 'package:isar/isar.dart';

import '../../../services/isar_database.dart';
import '../../../services/storage_service.dart';
import '../../../util/constant.dart';

class InitAppModel {
  final bool hasSystemAccounts;
  final List<Map<String, dynamic>> settings;
  final bool isLoggedin;
  InitAppModel({
    required this.hasSystemAccounts,
    required this.settings,
    required this.isLoggedin,
  });
}

final inttAppProvider = FutureProvider.autoDispose<InitAppModel>((ref) async {
  final accounts = await ref.watch(hasSystemAccountsProvider);
  final settings = await ref.watch(settingsProvider);
  final isLoggedin = await ref.watch(isLoggedInProvider);

  return InitAppModel(
    hasSystemAccounts: accounts,
    settings: settings,
    isLoggedin: isLoggedin,
  );
});

// -- IS LOGGEDIN
final isLoggedInProvider = Provider.autoDispose((ref) async {
  try {
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();

      //--Token
    }
    return true;
  } catch (e) {
    return false;
  }
});

//--REGISTER FOR PUSH NOTIFICATION

//-- SETTINGS
final settingsProvider = Provider.autoDispose((ref) async {
  try {
    final s = await IsarHelper.instance.db!.settingsModels
        .filter()
        .valueIsNotEmpty()
        .findAll();

    List<Map<String, dynamic>> data = [];
    for (var element in s) {
      data.addAll([
        {'variable': element.variable, 'value': element.value}
      ]);
    }

    //-UPDATE TO STORAGE
    Storage.instance.box.writeInMemory('settings', data);

    return data;
  } catch (e) {
    rethrow;
  }
});

final hasSystemAccountsProvider = Provider.autoDispose((ref) async {
  try {
    //-- Initial Data
    String defaultDateFormat = dateFormat[0];
    String defaultCurrency = currencies[0]['code'];

    //--Scroll
    final scrollNo = await IsarHelper.instance.db!.scrollModels.count();
    if (scrollNo == 0) {
      final data = ScrollModel()..scrollNo = 1;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.scrollModels.put(data);
      });
    }

    //--Settings
    final hasSettings = await IsarHelper.instance.db!.settingsModels.count();

    if (hasSettings == 0) {
      final appName = SettingsModel()
        ..variable = 'app_name'
        ..value = 'Findo';
      final developer = SettingsModel()
        ..variable = 'developer'
        ..value = 'Subha SUndar Das';
      final supportEmail = SettingsModel()
        ..variable = 'email'
        ..value = 'infolinematrix@gmail.com';

      final startDate = SettingsModel()
        ..variable = 'start_date'
        ..value = DateTime.now().toString();

      final name = SettingsModel()
        ..variable = 'name'
        ..value = 'Your Name';

      final dateFormat = SettingsModel()
        ..variable = 'dateFormat'
        ..value = defaultDateFormat;

      final dCurrency = SettingsModel()
        ..variable = 'defaultCurrency'
        ..value = defaultCurrency;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.settingsModels.putAll([
          appName,
          supportEmail,
          startDate,
          developer,
          dateFormat,
          dCurrency,
          name
        ]);
      });

      //--UPDATE LOCAL STORAGE
      final data = await IsarHelper.instance.db!.settingsModels
          .filter()
          .variableIsNotEmpty()
          .sortByVariable()
          .findAll();

      await Storage.instance.box.write('settings', data);

      //--SYSTEM ACCOUNT
      final hasSystemAccounts =
          await IsarHelper.instance.db!.accountsModels.count();

      if (hasSystemAccounts == 0) {
        final cash = AccountsModel()
          ..accountType = 'CASH'
          ..id = 1
          ..parent = 0
          ..name = "CASH"
          ..hasChild = false
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final bank = AccountsModel()
          ..accountType = 'BANK'
          ..id = 2
          ..hasChild = true
          ..name = "Bank"
          ..parent = 0
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final mybank = AccountsModel()
          ..accountType = 'BANK'
          ..id = 3
          ..hasChild = false
          ..name = "My Bank"
          ..parent = 2
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = false;

        final income = AccountsModel()
          ..accountType = 'INCOME'
          ..id = 4
          ..hasChild = true
          ..name = "Income Account"
          ..parent = 0
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final expenses = AccountsModel()
          ..accountType = 'EXPENDITURE'
          ..id = 5
          ..hasChild = true
          ..name = "Expense Account"
          ..parent = 0
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final liabilities = AccountsModel()
          ..accountType = 'LIABILITIES'
          ..id = 6
          ..hasChild = true
          ..name = "Liabilities"
          ..parent = 0
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final investments = AccountsModel()
          ..accountType = 'INVESTMENT'
          ..id = 7
          ..hasChild = true
          ..name = "Investments"
          ..parent = 0
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = true;

        final others = AccountsModel()
          ..accountType = 'EXPENDITURE'
          ..id = 8
          ..hasChild = false
          ..name = "Other (Not classified)"
          ..parent = 5
          ..openingBalance = 0.00
          ..status = 51
          ..isSystem = false;

        await IsarHelper.instance.db!.writeTxn(() async {
          await IsarHelper.instance.db!.accountsModels.putAll([
            cash,
            bank,
            mybank,
            income,
            expenses,
            liabilities,
            investments,
            others
          ]);
        });
      }
    }
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
});
