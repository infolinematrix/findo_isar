import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../models/transactions_model.dart';
import '../../../services/isar_database.dart';

final recentTransactionsProvider = FutureProvider.autoDispose((ref) async {
  try {
    List<TransactionsModel> data =
        await IsarHelper.instance.db!.transactionsModels
            .filter()
            .amountGreaterThan(0)
            .and()
            .group(
              (q) => q.statusEqualTo(51),
            )
            .sortByCreatedAtDesc()
            .distinctByScrollNo()
            .limit(25)
            .findAll();

    return data;
  } catch (e) {
    rethrow;
  }
});
