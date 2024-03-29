//-- BANK BOOK
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import '../../../models/transactions_model.dart';
import '../../../services/isar_database.dart';

import 'package:isar/isar.dart';

import '../../../application/closing_balance_provider.dart';
import '../../../util/date_utils.dart';

//-- SELECTED ACCOUNT
final selectedAccount = StateProvider.autoDispose<int>((ref) {
  return 0;
});

//--START DATE
final startDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return dayStart(firstDayOfMonth(DateTime.now()));
});

//--END DATE
final endDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return dayEnd(lastDayOfMonth(DateTime.now()));
});

//--TOTAL DR/CR
final totalDebitProvider = StateProvider.autoDispose<double>((ref) {
  return 0.00;
});
final totalCreditProvider = StateProvider.autoDispose<double>((ref) {
  return 0.00;
});

//--OENING BALANCE
final openingBalanceProvider = StateProvider.autoDispose<double>((ref) {
  return 0.00;
});

//--YEARS
final yearsProvider = StateProvider<List>((ref) {
  int currentYear = DateTime.now().year;
  int startingYear = 2000;

  List years = [];
  int count = currentYear - startingYear;
  for (var i = 0; i < count; i++) {
    years.add([startingYear + i]);
  }
  return years;
});

//--BANK ACOOUNT PROVIDER
final bankAccountsProvider = FutureProvider.autoDispose((ref) async {
  try {
    final banks = await IsarHelper.instance.db!.accountsModels
        .filter()
        .accountTypeEqualTo('BANK')
        .and()
        .statusEqualTo(51)
        .and()
        .hasChildEqualTo(false)
        .not()
        .parentEqualTo(0)
        .findAll();

    return banks;
  } catch (e) {
    rethrow;
  }
});

//--BANK BOOK
final bankBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final accountNo = ref.watch(selectedAccount);
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final txns = await IsarHelper.instance.db!.transactionsModels
        .where(sort: Sort.desc)
        .txnDateBetween(sDate, eDate)
        .filter()
        .group(
          (q) => q.statusEqualTo(51).and().onAccountEqualTo(accountNo),
        )
        .findAll();

    double totalDr = 0.00, totalCr = 0.00;

    //---Opening Balance
    final oeningBalance = await ref.watch(
        closingBalanceProvider({'date': sDate, 'account': accountNo}).future);

    // for (var txn in txns) {
    //   if (txn.scrollType == ScrollType.HC ||
    //       txn.scrollType == ScrollType.BC ||
    //       txn.scrollType == ScrollType.TC) {
    //     totalCr += txn.amount;
    //   } else if (txn.scrollType == ScrollType.HD ||
    //       txn.scrollType == ScrollType.BD ||
    //       txn.scrollType == ScrollType.TD) {
    //     totalDr += txn.amount;
    //   }
    // }

    for (var txn in txns) {
      if (txn.scrollType == ScrollType.HC || txn.scrollType == ScrollType.BC) {
        totalCr += txn.amount;
      }
      //If transfer it will be opposit
      if (txn.scrollType == ScrollType.TC) {
        totalDr += txn.amount;
      }
      if (txn.scrollType == ScrollType.HD || txn.scrollType == ScrollType.BD) {
        totalDr += txn.amount;
      }
      //If transfer it will be opposit
      if (txn.scrollType == ScrollType.TD) {
        totalCr += txn.amount;
      }
    }

    ref.watch(totalCreditProvider.notifier).update((state) => totalCr);
    ref.watch(totalDebitProvider.notifier).update((state) => totalDr);
    ref.watch(openingBalanceProvider.notifier).update((state) => oeningBalance);

    return txns;
  } catch (e) {
    rethrow;
  }
});

//--PAYMENT BOOK
final paymentBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final txns = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .group((q) => q
            .statusEqualTo(51)
            .and()
            .scrollTypeEqualTo(ScrollType.HC)
            .or()
            .scrollTypeEqualTo(ScrollType.BC))
        .sortByTxnDateDesc()
        .findAll();

    double totalDr = 0.00, totalCr = 0.00;

    for (var txn in txns) {
      if (txn.scrollType == ScrollType.HC ||
          txn.scrollType == ScrollType.BC ||
          txn.scrollType == ScrollType.TC) {
        totalCr += txn.amount;
      } else if (txn.scrollType == ScrollType.HD ||
          txn.scrollType == ScrollType.BD ||
          txn.scrollType == ScrollType.TD) {
        totalDr += txn.amount;
      }
    }

    ref.watch(totalCreditProvider.notifier).update((state) => totalCr);
    ref.watch(totalDebitProvider.notifier).update((state) => totalDr);

    return txns;
  } catch (e) {
    rethrow;
  }
});

//--PAYMENT BOOK
final receivedBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final txns = await IsarHelper.instance.db!.transactionsModels
        .where()
        .txnDateBetween(sDate, eDate)
        .filter()
        .group((q) => q
            .statusEqualTo(51)
            .and()
            .scrollTypeEqualTo(ScrollType.HD)
            .or()
            .scrollTypeEqualTo(ScrollType.BD))
        .sortByTxnDateDesc()
        .findAll();

    double totalDr = 0.00, totalCr = 0.00;

    for (var txn in txns) {
      if (txn.scrollType == ScrollType.HC ||
          txn.scrollType == ScrollType.BC ||
          txn.scrollType == ScrollType.TC) {
        totalCr += txn.amount;
      } else if (txn.scrollType == ScrollType.HD ||
          txn.scrollType == ScrollType.BD ||
          txn.scrollType == ScrollType.TD) {
        totalDr += txn.amount;
      }
    }

    ref.watch(totalCreditProvider.notifier).update((state) => totalCr);
    ref.watch(totalDebitProvider.notifier).update((state) => totalDr);

    return txns;
  } catch (e) {
    rethrow;
  }
});

//--CASH BOOK
final cashBookProvider = FutureProvider.autoDispose((ref) async {
  try {
    final sDate = ref.watch(startDateProvider);
    final eDate = ref.watch(endDateProvider);

    final txns = await IsarHelper.instance.db!.transactionsModels
        .where(sort: Sort.desc)
        .txnDateBetween(sDate, eDate)
        .filter()
        .group((q) => q.statusEqualTo(51).and().onAccountEqualTo(1))
        .findAll();

    double totalDr = 0.00, totalCr = 0.00;

    //---Opening Balance
    final oeningBalance = await ref
        .watch(closingBalanceProvider({'date': sDate, 'account': 1}).future);

    for (var txn in txns) {
      if (txn.scrollType == ScrollType.HC || txn.scrollType == ScrollType.BC) {
        totalCr += txn.amount;
      }
      //If transfer it will be opposit
      if (txn.scrollType == ScrollType.TC) {
        totalDr += txn.amount;
      }
      if (txn.scrollType == ScrollType.HD || txn.scrollType == ScrollType.BD) {
        totalDr += txn.amount;
      }
      //If transfer it will be opposit
      if (txn.scrollType == ScrollType.TD) {
        totalCr += txn.amount;
      }
    }

    ref.watch(totalCreditProvider.notifier).update((state) => totalCr);
    ref.watch(totalDebitProvider.notifier).update((state) => totalDr);
    ref.watch(openingBalanceProvider.notifier).update((state) => oeningBalance);

    return txns;
  } catch (e) {
    rethrow;
  }
});

//--ACCOUNTS SUMMARY
final accountsSummaryProvider = FutureProvider.autoDispose((ref) async {
  try {
    final startDate = ref.watch(startDateProvider);
    final endDate = dayEnd(ref.watch(endDateProvider));

    final accounts = await IsarHelper.instance.db!.accountsModels
        .where()
        .statusEqualTo(51)
        .filter()
        .hasChildEqualTo(false)
        .not()
        .accountTypeEqualTo('CASH')
        .not()
        .accountTypeEqualTo('BANK')
        .sortByName()
        .findAll();

    List<Map<String, dynamic>> data = [];

    for (var account in accounts) {
      final txns = await IsarHelper.instance.db!.transactionsModels
          .where()
          .accountNoEqualTo(account.id)
          .filter()
          .txnDateBetween(startDate, endDate)
          .and()
          .statusEqualTo(51)
          .findAll();

      double totalDr = 0.00, totalCr = 0.00, total = 0.00;

      for (var txn in txns) {
        if (txn.scrollType == ScrollType.HC ||
            txn.scrollType == ScrollType.BC) {
          totalDr += txn.amount;
        } else if (txn.scrollType == ScrollType.HD ||
            txn.scrollType == ScrollType.BD) {
          totalCr += txn.amount;
        }
      }

      total = totalCr - totalDr;
      if (total != 0) {
        data.addAll([
          {
            'account': account.name.toString().capitalize,
            'account_description': account.description != null
                ? account.description.toString().capitalize
                : 'No description found',
            'account_budget': account.budget,
            'total_debit': totalDr,
            'total_credit': totalCr,
            'total': total < 0 ? total.abs() : total
          }
        ]);
      }
    }

    return data;
  } catch (e) {
    rethrow;
  }
});

//--MY SAVINGS ---------------------//
final yearsListProvider = StateProvider.autoDispose((ref) {
  int currentYear = DateTime.now().year;
  int startingYear = 2022;
  List yearList = List.generate(
      (currentYear - startingYear) + 1, (index) => startingYear + index);
  return yearList;
});
final selectedYearProvider = StateProvider.autoDispose<int>((ref) {
  return DateTime.now().year;
});

final totalIncomeProvider = StateProvider<double>((ref) {
  return 0.00;
});

final totalExpenditureProvider = StateProvider<double>((ref) {
  return 0.00;
});

final mySavingsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  try {
    int selectedyear = ref.watch(selectedYearProvider);
    

    List<Map<String, dynamic>> data = [];
    for (var i = 0; i < 12; i++) {
      DateTime startDate =
          dayStart(firstDayOfMonth(DateTime(selectedyear, i + 1)));
      DateTime endDate = dayEnd(lastDayOfMonth(DateTime(selectedyear, i + 1)));
      double income = 0, expenditure = 0, savings = 0;
      final txns = await IsarHelper.instance.db!.transactionsModels
          .where()
          .txnDateBetween(startDate, endDate)
          .filter()
          .group((q) => q
              .statusEqualTo(51)
              .not()
              .scrollTypeEqualTo(ScrollType.TC)
              .not()
              .scrollTypeEqualTo(ScrollType.TD))
          .findAll();

      for (var txn in txns) {
        if (txn.scrollType == ScrollType.BD ||
            txn.scrollType == ScrollType.HD) {
          income += txn.amount;
        }
        if (txn.scrollType == ScrollType.BC ||
            txn.scrollType == ScrollType.HC) {
          expenditure += txn.amount;
        }
      }

      savings = income - expenditure;
      data.addAll([
        {
          'year': selectedyear,
          'month': i,
          'income': income,
          'expenditure': expenditure,
          'savings': savings,
        },
      ]);

      ref
          .watch(totalIncomeProvider.notifier)
          .update((state) => ref.read(totalIncomeProvider) + income);

      ref
          .watch(totalExpenditureProvider.notifier)
          .update((state) => ref.read(totalExpenditureProvider) + expenditure);
    }

    return data;
  } catch (e) {
    rethrow;
  }
});
