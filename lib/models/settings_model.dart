import 'package:isar/isar.dart';

part 'settings_model.g.dart';

@Collection()
class SettingsModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(replace: true, unique: true)
  String? variable;

  String? value;
}
