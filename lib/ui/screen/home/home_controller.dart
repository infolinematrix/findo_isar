import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/util/date_utils.dart';
import 'package:isar/isar.dart';

import '../../../models/transactions_model.dart';
import '../../../services/isar_database.dart';
import '../../../services/storage_service.dart';

//========= HOME DATA MODEL
class InitHomeModel {
  final List<TransactionsModel> recentTransactions;
  final Map<String, dynamic> settings;
  final Map<String, dynamic> monthIncomeExpenditure;
  final Map<String, dynamic> currentBalance;

  InitHomeModel(
      {required this.recentTransactions,
      required this.monthIncomeExpenditure,
      required this.currentBalance,
      required this.settings});
}

final inttHomeProvider = FutureProvider.autoDispose<InitHomeModel>((ref) async {
  try {
    final txnRecent = await ref.watch(recentTransactionsProvider.future);
    final settingsData = await ref.watch(settingsProvider.future);
    final cBal = await ref.watch(currentBalanceProvider.future);
    final monthIncomeExpenditure =
        await ref.watch(currentMonthSummaryProvider.future);

    return InitHomeModel(
        recentTransactions: txnRecent,
        currentBalance: cBal,
        monthIncomeExpenditure: monthIncomeExpenditure,
        settings: settingsData);
  } catch (e) {
    rethrow;
  }
});

//--CURRENT MONTH STATISTIC
final currentMonthSummaryProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  try {
    final startDate = dayStart(firstDayOfMonth(DateTime.now()));
    final endDate = dayEnd(lastDayOfMonth(DateTime.now()));

    List<TransactionsModel> data = await IsarHelper
        .instance.db!.transactionsModels
        .where()
        .txnDateBetween(startDate, endDate)
        .filter()
        .statusEqualTo(51)
        .not()
        .group((q) => q
            .scrollTypeEqualTo(ScrollType.TC)
            .or()
            .scrollTypeEqualTo(ScrollType.TD))
        .findAll();

    double totalDebit = 0.00;
    double totalCredit = 0.00;

    for (var txn in data) {
      if (txn.scrollType == ScrollType.HC || txn.scrollType == ScrollType.BC) {
        totalDebit += txn.amount;
      } else if (txn.scrollType == ScrollType.HD ||
          txn.scrollType == ScrollType.BD) {
        totalCredit += txn.amount;
      }
    }

    double exp = 100;
    double save = 0;

    if (totalDebit != 0) {
      if (totalDebit >= totalCredit) {
        exp = 100;
      } else {
        exp = totalDebit / totalCredit * 100;
        save = 100 - exp;
      }
    }

    final mappedData = {
      'totalDebitMonth': totalDebit,
      'totalCreditMonth': totalCredit,
      'expenditurePercentage': exp.roundToDouble(),
      'savingsPercentage': save.roundToDouble()
    };

    return mappedData;
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

//-- Settings
final settingsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final Map<String, dynamic> settings =
        await Storage.instance.box.read('settings') as Map<String, dynamic>;
    return settings;
  } catch (e) {
    rethrow;
  }
});

//--CURRENT BALANCE (CASH/BANK)

final currentBalanceProvider = FutureProvider.autoDispose((ref) async {
  final Map<String, dynamic> data = {};

  //--cash
  final txn = await IsarHelper.instance.db!.transactionsModels
      .where()
      .onAccountEqualTo(1)
      .filter()
      .statusEqualTo(51)
      .sortByScrollNoDesc()
      .limit(1)
      .findFirst();

  data['cashBalance'] = txn!.onAccountCurrentBalance;

  //--all bank
  double bankBalance = 0.00;

  final banks = await IsarHelper.instance.db!.accountsModels
      .where()
      .accountTypeEqualTo('BANK')
      .filter()
      .statusEqualTo(51)
      .and()
      .hasChildEqualTo(false)
      .findAll();

  for (var acct in banks) {
    final txn = await IsarHelper.instance.db!.transactionsModels
        .where()
        .onAccountEqualTo(acct.id)
        .filter()
        .statusEqualTo(51)
        .sortByScrollNoDesc()
        .limit(1)
        .findFirst();

    if (txn != null) {
      bankBalance += txn.onAccountCurrentBalance;
    }
  }

  data['bankBalance'] = bankBalance;

  return data;
});
