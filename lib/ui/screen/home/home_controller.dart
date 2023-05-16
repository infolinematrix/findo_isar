import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/util/date_utils.dart';
import 'package:isar/isar.dart';

import '../../../models/transactions_model.dart';
import '../../../services/isar_database.dart';

//========= HOME DATA MODEL
class InitHomeModel {
  final List<TransactionsModel> recentTransactions;
  // final Map<String, dynamic> todaysIncomeExpenditure;
  final Map<String, dynamic> monthIncomeExpenditure;
  // final bool updateAvailable;
  InitHomeModel({
    required this.recentTransactions,
    // required this.todaysIncomeExpenditure,
    required this.monthIncomeExpenditure,
    // required this.updateAvailable
    //
  });
}

final inttHomeProvider = FutureProvider.autoDispose<InitHomeModel>((ref) async {
  try {
    final txnRecent = await ref.watch(recentTransactionsProvider.future);
    // final todaysIncomeExpenditure =
    //     await ref.watch(todaysIncomeExpenditureProvider);
    final monthIncomeExpenditure =
        await ref.watch(currentMonthSummaryProvider.future);
    // final updateAvailabale = await ref.watch(updateAvailableProvider);

    return InitHomeModel(
      recentTransactions: txnRecent,
      // todaysIncomeExpenditure: todaysIncomeExpenditure,
      monthIncomeExpenditure: monthIncomeExpenditure,
      // updateAvailable: updateAvailabale,
    );
  } catch (e) {
    rethrow;
  }
});

//--CURRENT MONTH STATISTIC
final currentMonthSummaryProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  try {
    final startDate = firstDayOfMonth(DateTime.now());
    final endDate = lastDayOfMonth(DateTime.now());

    List<TransactionsModel> data = await IsarHelper
        .instance.db!.transactionsModels
        .where()
        .txnDateBetween(startDate, endDate)
        .filter()
        .statusEqualTo(51)
        .findAll();

    double totaldrMonth = 0.00;
    double totaldrDay = 0.00;
    double totalcrMonth = 0.00;
    double totalcrDay = 0.00;

    for (var txn in data) {
      if (txn.txnType == TxnType.DR) {
        totaldrMonth += txn.amount;
        if (txn.txnDate!.day == DateTime.now().day) {
          totaldrDay += txn.amount;
        }
      } else {
        totalcrMonth += txn.amount;
        if (txn.txnDate!.day == DateTime.now().day) {
          totalcrDay += txn.amount;
        }
      }
    }

    return {
      'totalDebitMonth': totaldrMonth,
      'totalCreditMonth': totalcrMonth,
      'totalDebitDay': totaldrDay,
      'totalCreditDay': totalcrDay,
    };
  } catch (e) {
    rethrow;
  }
});

//--RECENT TRANSACTIONS
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
