import 'package:isar/isar.dart';

part 'settings_model.g.dart';

@Collection(inheritance: false)
class SettingsModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(caseSensitive: false, replace: true, unique: true)
  String? variable;

  String? value;
}
