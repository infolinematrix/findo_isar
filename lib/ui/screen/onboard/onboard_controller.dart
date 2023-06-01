import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/models/scroll_model.dart';
import 'package:flutter_wallet/models/settings_model.dart';
import 'package:isar/isar.dart';

import '../../../services/isar_database.dart';
import '../../../services/storage_service.dart';

class InitAppModel {
  final bool hasSystemAccounts;
  final List<SettingsModel> settings;
  final bool isLoggedin;
  final bool scrollNo;
  InitAppModel(
      {required this.hasSystemAccounts,
      required this.settings,
      required this.isLoggedin,
      required this.scrollNo});
}

final inttAppProvider = FutureProvider.autoDispose<InitAppModel>((ref) async {
  final isLoggedin = await ref.watch(isLoggedInProvider);
  final settings = await ref.watch(settingsProvider);
  final accounts = await ref.watch(hasSystemAccountsProvider);
  final scrollNo = await ref.watch(scrollProvider);
  return InitAppModel(
      isLoggedin: isLoggedin,
      settings: settings,
      hasSystemAccounts: accounts,
      scrollNo: scrollNo);
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

//-- SETTINGS
final settingsProvider = Provider.autoDispose((ref) async {
  try {
    // String defaultDateFormat = dateFormat[0];
    // String defaultCurrency = currencies[0]['code'];
    // String defuldCurrencyFormat = currencyFormat[0];

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

      //--Save new Settings
      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.settingsModels.putAll([
          appName,
          supportEmail,
          startDate,
          developer,
        ]);
      });
    }

    final settings = await IsarHelper.instance.db!.settingsModels
        .filter()
        .valueIsNotEmpty()
        .findAll();
    Storage.instance.box.writeInMemory('settings', settings);

    return settings;
  } catch (e) {
    rethrow;
  }
});

//--SCROLL
final scrollProvider = Provider.autoDispose((ref) async {
  try {
    final scrollNo = await IsarHelper.instance.db!.scrollModels.count();
    if (scrollNo == 0) {
      final data = ScrollModel()..scrollNo = 1;

      await IsarHelper.instance.db!.writeTxn(() async {
        await IsarHelper.instance.db!.scrollModels.put(data);
      });

      return true;
    }
    return false;
  } catch (e) {
    rethrow;
  }
});

//--System Account
final hasSystemAccountsProvider = Provider.autoDispose((ref) async {
  try {
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

    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
});
