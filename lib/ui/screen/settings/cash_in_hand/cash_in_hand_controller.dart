import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/accounts_model.dart';
import '../../../../services/isar_database.dart';

import 'package:isar/isar.dart';

final cashAccountProvider =
    FutureProvider.autoDispose<AccountsModel>((ref) async {
  final ac = await IsarHelper.instance.db!.accountsModels
      .where()
      .idEqualTo(1)
      .findFirst();

  return ac!;
});

final updateOpeningBalanceProvider =
    FutureProvider.family.autoDispose((ref, Map<String, dynamic> data) async {
  final a = await IsarHelper.instance.db!.accountsModels
      .where()
      .idEqualTo(1)
      .findFirst();

  a!.openingBalance = data['balance'];

  await IsarHelper.instance.db!.writeTxn(() async {
    await IsarHelper.instance.db!.accountsModels.put(a);
    return true;
  });

  return false;
});
