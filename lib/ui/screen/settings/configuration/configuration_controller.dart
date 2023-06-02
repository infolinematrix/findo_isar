import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../models/settings_model.dart';
import '../../../../services/isar_database.dart';
import '../../../../services/storage_service.dart';

final configurationProvider = FutureProvider.autoDispose((ref) async {
  final settings = await IsarHelper.instance.db!.settingsModels
      .filter()
      .variableIsNotEmpty()
      .findAll();

  var result = {for (var v in settings) v.variable: v.value};

  return result;
});

final saveConfigurationProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> formData) async {
  try {
    final name = SettingsModel()
      ..variable = 'name'
      ..value = formData['name'];

    final currency = SettingsModel()
      ..variable = 'currency'
      ..value = formData['currency'];

    final dateFormat = SettingsModel()
      ..variable = 'dateFormat'
      ..value = formData['dateFormat'];

    final defaultCurrency = SettingsModel()
      ..variable = 'defaultCurrency'
      ..value = formData['defaultCurrency'];

    final defaultCurrencyFormat = SettingsModel()
      ..variable = 'defaultCurrencyFormat'
      ..value = formData['defaultCurrencyFormat'];

    final defaultLanguage = SettingsModel()
      ..variable = 'defaultLanguage'
      ..value = formData['defaultLanguage'];

    //--Save new Settings
    await IsarHelper.instance.db!.writeTxn(() async {
      await IsarHelper.instance.db!.settingsModels.putAll([
        name,
        currency,
        dateFormat,
        defaultCurrency,
        defaultCurrencyFormat,
        defaultLanguage
      ]);
    });

    //--Update Local Store with settings data
    final settings = await IsarHelper.instance.db!.settingsModels
        .filter()
        .valueIsNotEmpty()
        .findAll();

    Storage.instance.box.writeInMemory('settings', settings);

    return true;
  } catch (e) {
    rethrow;
  }
});
