import 'package:isar/isar.dart';

part 'scroll_model.g.dart';

@Collection(inheritance: false)
class ScrollModel {
  @Index()
  Id id = Isar.autoIncrement;

  int scrollNo = 0;
  DateTime updatedAt = DateTime.now();
}
