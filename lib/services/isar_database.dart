import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/accounts_model.dart';
import '../models/scroll_model.dart';
import '../models/settings_model.dart';
import '../models/transactions_model.dart';

class IsarHelper {
  IsarHelper._privateConstructor();
  static final IsarHelper _instance = IsarHelper._privateConstructor();
  static IsarHelper get instance => _instance;

  Isar? db;

  init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      if (Isar.instanceNames.isEmpty) {
        db = await Isar.open(
          [
            AccountsModelSchema,
            SettingsModelSchema,
            TransactionsModelSchema,
            ScrollModelSchema
          ],
          directory: dir.path,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
