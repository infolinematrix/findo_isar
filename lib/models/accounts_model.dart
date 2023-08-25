import 'package:isar/isar.dart';

part 'accounts_model.g.dart';

@Collection(inheritance: false)
class AccountsModel {
  @Index()
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(unique: true, caseSensitive: false)
  String? name;

  int bankAccountNo = 0;

  @Index()
  String? accountType;

  double budget = 0.00;
  String? description;
  String? defaultNarration;

  @Index()
  bool hasChild = false;

  @Index()
  int parent = 0;

  double openingBalance = 0.00;

  @Index()
<<<<<<< HEAD:lib/models/accounts_model.dart
  bool isSystem = false;
=======
  bool isSystem = true;
>>>>>>> 9e0f143 (Subha):lib/data/models/accounts_model.dart

  @Index()
  int status = 51;
}

enum AccountType { capital, income, expenditure, investment }
