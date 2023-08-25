import 'package:findo_isar/data/models/transactions_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../app/services/isar_database.dart';
import '../../../utils/date_utils.dart';

final selectedIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

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

//-- INCOME/EXPENSES DATE WISE
final totalIncomeExpenditureProvider = FutureProvider.family
    .autoDispose((ref, Map<String, dynamic> dateRange) async {
  try {
    final txns = await IsarHelper.instance.db!.transactionsModels
        .filter()
        .statusEqualTo(51)
        .txnDateBetween(dateRange['startDate'], dateRange['endDate'])
        .and()
        .amountGreaterThan(0)
        .distinctByScrollNo()
        .findAll();

    double amountDr = 0;
    double amountCr = 0;

    for (var txn in txns) {
      if (txn.txnType == TxnType.DR) {
        amountDr = amountDr + txn.amount;
        continue;
      } else {
        amountCr = amountCr + txn.amount;
        continue;
      }
    }

    final data = {'totalDr': amountDr, 'totalCr': amountCr};

    return data;
  } catch (e) {
    rethrow;
  }
});

//========= HOME DATA MODEL
class InitHomeModel {
  final List<TransactionsModel> recentTransactions;
  final Map<String, dynamic> todaysIncomeExpenditure;
  // final Map<String, dynamic> monthIncomeExpenditure;
  // final bool updateAvailable;
  InitHomeModel({
    required this.recentTransactions,
    required this.todaysIncomeExpenditure,
    // required this.monthIncomeExpenditure,
    // required this.updateAvailable
    //
  });
}

final inttHomeProvider = FutureProvider.autoDispose<InitHomeModel>((ref) async {
  try {
    final txnRecent = await ref.watch(recentTxnProvider.future);
    final todaysIncomeExpenditure =
        await ref.watch(todaysIncomeExpenditureProvider);
    // final monthIncomeExpenditure =
    //     await ref.watch(monthIncomeExpenditureProvider);
    // final updateAvailabale = await ref.watch(updateAvailableProvider);

    return InitHomeModel(
      recentTransactions: txnRecent,
      todaysIncomeExpenditure: todaysIncomeExpenditure,
      // monthIncomeExpenditure: monthIncomeExpenditure,
      // updateAvailable: updateAvailabale,
    );
  } catch (e) {
    rethrow;
  }
});

//--Recent Transactions
final recentTxnProvider = FutureProvider.autoDispose((ref) async {
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

// final homeDataStateProvider = StateNotifierProvider((ref) {
//   return HomeData();
// });

// class HomeData extends StateNotifier<Map<String, dynamic>> {
//   HomeData() : super({}) {
//     loadHomeData();
//   }

//   loadHomeData() async {
//     try {} catch (e) {
//       rethrow;
//     }
//   }
// }

//-- Today's Income Expenses

final todaysIncomeExpenditureProvider = Provider.autoDispose((ref) async {
  final data = await IsarHelper.instance.db!.transactionsModels
      .where()
      .txnDateBetween(dateTodayStart(), DateTime.now())
      .findAll();

  double amountDr = 0.00;
  double amountCr = 0.00;

  for (TransactionsModel txn in data) {
    if (txn.status != 98) {
      if (txn.txnType == TxnType.DR) {
        amountDr += txn.amount;
      } else {
        amountCr += txn.amount;
      }
    }
  }

  final jsondata = {'debit': amountDr, 'credit': amountCr};

  return jsondata;
});

//-- Monthly Income Expenses
final monthIncomeExpenditureProvider = Provider.autoDispose((ref) async {
  return;
});

//--Update available
final updateAvailableProvider = Provider.autoDispose((ref) async {
  return;
});
