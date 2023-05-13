import 'package:isar/isar.dart';

part 'transactions_model.g.dart';

@Collection()
class TransactionsModel {
  @Index()
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index()
  DateTime? txnDate;

  @Index()
  DateTime createdAt = DateTime.now();

  @enumerated
  ScrollType scrollType = ScrollType.HD;
  int scrollNo = 0;
  @Index(composite: [CompositeIndex('scrollType'), CompositeIndex('scrollNo')])
  int scrollSlNo = 0;

  @Index()
  @enumerated
  TxnType txnType = TxnType.DR;

  @Index()
  int accountNo = 0;
  String? accountName;

  String? narration;
  double amount = 0.00;
  String? description;
  int status = 51;

  @Index()
  int onAccount = 0;
  String? onAccountName;
}

enum TxnType { DR, CR }

enum ScrollType { HC, HD, TC, TD }
