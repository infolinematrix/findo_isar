import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transactions_model.dart';
import '../services/isar_database.dart';
import 'package:isar/isar.dart';

final closingBalanceProvider = FutureProvider.family((ref, Map arg) async {
  try {
    DateTime cbalDate = arg['date'];
    int cbalAccount = arg['account'];

    final txn = await IsarHelper.instance.db!.transactionsModels
        .where()
        .onAccountEqualTo(cbalAccount)
        .filter()
        .txnDateLessThan(cbalDate)
        .sortByScrollNoDesc()
        .findFirst();

    if (txn == null) return 0.00;
    return txn.onAccountCurrentBalance;
  } catch (e) {
    return 0.00;
  }
});
