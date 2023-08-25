// import 'package:findo_isar/presentations/screens/settings/settings_screen.dart';

import 'package:findo_isar/presentations/screens/accounts/create/expenses_create_screen.dart';
import 'package:findo_isar/presentations/screens/accounts/create/income_create_screen.dart';
import 'package:findo_isar/presentations/screens/backup/backup_screen.dart';
import 'package:findo_isar/presentations/screens/search/search_screen.dart';
import 'package:findo_isar/presentations/screens/settings/configuration_screen.dart';
import 'package:findo_isar/presentations/screens/settings/data_clean_screen.dart';
import 'package:findo_isar/presentations/screens/statement/account_statement_screen.dart';
import 'package:findo_isar/presentations/screens/transactions/txn_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentations/screens/accounts/accounts_child_screen.dart';
import '../presentations/screens/accounts/accounts_screen.dart';
import '../presentations/screens/accounts/create/bank_create_screen.dart';
import '../presentations/screens/accounts/update/bank_update_screen.dart';
import '../presentations/screens/accounts/update/expenses_update_screen.dart';
import '../presentations/screens/accounts/update/income_update_screen.dart';
import '../presentations/screens/onboard/onboard_screen.dart';
import '../presentations/screens/reports/expenditure_report_screen.dart';
import '../presentations/screens/reports/income_report_screen.dart';
import '../presentations/screens/transactions/txn_accounts_screen.dart';
import '../presentations/screens/transactions/txn_gate_screen.dart';
import '../presentations/screens/transactions/txn_payment_screen.dart';
import '../presentations/screens/transactions/txn_receive_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    name: 'ONBOARD',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const OnBoardScreen(),
    ),
  ),
  GoRoute(
    path: '/configuration',
    name: 'CONFIGURATION',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const ConfigurationScreen(),
    ),
  ),
  GoRoute(
    path: '/accounts',
    name: 'ACCOUNTS',
    pageBuilder: (context, state) {
      Map extra = state.extra! as Map;

      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: AccountsScreen(
          parent: extra['parent'],
          title: extra['title'],
        ),
      );
    },
    routes: [
      GoRoute(
        path: 'accounts-child',
        name: 'ACCOUNTS-CHILD',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;

          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: AccountsChildScreen(
              account: extra['account'],
            ),
          );
        },
      ),
      GoRoute(
        path: 'bank-account-create',
        name: 'BANK-ACCOUNT-CREATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: BankAccountCreateScreen(
              parent: extra['parent'],
            ),
          );
        },
      ),
      GoRoute(
        path: 'bank-account-update',
        name: 'BANK-ACCOUNT-UPDATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: BankAccountUpdateScreen(
              id: extra['id'],
            ),
          );
        },
      ),
      //================
      GoRoute(
        path: 'expenses-account-create',
        name: 'EXPENSES-ACCOUNT-CREATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: ExpensesAccountCreateScreen(
              parent: extra['parent'],
            ),
          );
        },
      ),
      GoRoute(
        path: 'expenses-account-update',
        name: 'EXPENSES-ACCOUNT-UPDATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: ExpensesAccountUpdateScreen(
              id: extra['id'],
            ),
          );
        },
      ),
      //=============
      GoRoute(
        path: 'income-account-create',
        name: 'INCOME-ACCOUNT-CREATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: IncomeAccountCreateScreen(
              parent: extra['parent'],
            ),
          );
        },
      ),
      GoRoute(
        path: 'income-account-update',
        name: 'INCOME-ACCOUNT-UPDATE',
        pageBuilder: (context, state) {
          Map extra = state.extra! as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: IncomeAccountUpdateScreen(
              id: extra['id'],
            ),
          );
        },
      ),
      //============
    ],
  ),

  GoRoute(
      path: '/txn-gate',
      name: 'TXN_GATE',
      pageBuilder: (context, state) {
        // Map extra = state.extra! as Map;

        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const TransactionGate(),
        );
      },
      routes: [
        GoRoute(
          path: 'txn-select_account',
          name: 'TXN_SELECT_ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;

            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: TxnAccountSelectScreen(txnType: extra['txnType']),
            );
          },
        ),
        GoRoute(
          path: 'txn-payment',
          name: 'TXN_PAYMENT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;

            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: TxnPaymentScreen(account: extra['account']),
            );
          },
        ),
        GoRoute(
          path: 'txn-receive',
          name: 'TXN_RECEIVE',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;

            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: TxnReceiveScreen(account: extra['account']),
            );
          },
        ),
      ]),

  //--Transaction Detail
  GoRoute(
    path: '/txn-detail',
    name: 'TXN_DETAIL',
    pageBuilder: (context, state) {
      Map extra = state.extra! as Map;
      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: TxnDetailScreen(
          scrollNo: extra['scrollNo'],
        ),
      );
    },
  ),

  //--STATEMENT OF ACCOUNT
  GoRoute(
    path: '/account-statement',
    name: 'ACCOUNT-STATEMENT',
    pageBuilder: (context, state) {
      Map extra = state.extra! as Map;
      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: AccountStatementScreen(
          account: extra['account'],
        ),
      );
    },
  ),

  //--REPORT-EXPENDITURE
  GoRoute(
    path: '/report-expenditure',
    name: 'REPORT_EXPENDITURE',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const ExpenditureReportScreen(),
    ),
  ),

  //--REPORT-INCOME
  GoRoute(
    path: '/report-income',
    name: 'REPORT_INCOME',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const IncomeReportScreen(),
    ),
  ),

  //--SEARCH
  GoRoute(
    path: '/search',
    name: 'SEARCH',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const SearchScreen(),
    ),
  ),

  //== BACKUP
  GoRoute(
    path: '/backup',
    name: 'BACKUP',
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const BackupScreen(),
      );
    },
  ),

  //==Data Clean
  GoRoute(
    path: '/data-clean',
    name: 'DATA-CLEAN',
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const DataCleanScreen(),
      );
    },
  ),

  // GoRoute(
  //   path: '/reports',
  //   name: 'REPORTS',
  //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
  //     context: context,
  //     state: state,
  //     child: const ReportsScreen(),
  //   ),
  // ),
  // GoRoute(
  //   path: '/settings',
  //   name: 'SETTINGS',
  //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
  //     context: context,
  //     state: state,
  //     child: const SettingsScreen(),
  //   ),
  // ),
]);

/// TRANSITIONS

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
