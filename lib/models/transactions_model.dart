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
  ScrollType scrollType = ScrollType.hd;
  int scrollNo = 0;
  @Index(composite: [CompositeIndex('scrollType'), CompositeIndex('scrollNo')])
  int scrollSlNo = 0;

  @Index()
  @enumerated
  TxnType txnType = TxnType.dr;

  @Index()
  int accountNo = 0;
  String? accountName;

  String? narration;
  double amount = 0.00;
  String? description;

  @Index()
  int status = 51;

  @Index()
  int onAccount = 0;
  String? onAccountName;
  double onAccountCurrentBalance = 0.00;
}

enum TxnType { dr, cr }

enum ScrollType { hc, bc, hd, bd, tc, td }
