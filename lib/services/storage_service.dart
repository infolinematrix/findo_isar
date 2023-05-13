import 'package:get_storage/get_storage.dart';

class Storage {
  static Storage? _instance;
  Storage._();
  static Storage get instance => _instance ??= Storage._();

  final box = GetStorage();
}
