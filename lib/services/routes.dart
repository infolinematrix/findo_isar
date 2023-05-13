import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_child_screen.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_parent_screen.dart';
import 'package:flutter_wallet/ui/screen/onboard/onboard_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/bank_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/cash_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/report_screen.dart';
import 'package:flutter_wallet/ui/screen/settings/settings_screen.dart';
import 'package:flutter_wallet/ui/screen/statement/select_account_screen.dart';
import 'package:flutter_wallet/ui/screen/transactions/expenses_entry.dart';
import 'package:flutter_wallet/ui/screen/transactions/select_account.dart';
import 'package:go_router/go_router.dart';

import '../ui/screen/statement/statement_screen.dart';
import '../ui/screen/transactions/income_entry.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'ONBOARD',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OnBoardScreen(),
      ),
    ),

    //==SETTINGS
    GoRoute(
      path: '/settings',
      name: 'SETTINGS',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SettingsScreen(),
      ),
    ),

    //==ACCOUNTS
    GoRoute(
      path: '/accounts',
      name: 'ACCOUNTS',
      pageBuilder: (context, state) {
        Map extra = state.extra! as Map;
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: AccountsParentScreen(
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
      ],
    ),

    //==ENTRY
    GoRoute(
        path: '/entry',
        name: 'ENTRY',
        pageBuilder: (context, state) {
          Map extra = state.extra as Map;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: SelectAccount(
              entryType: extra['entryType'],
            ),
          );
        },
        routes: [
          GoRoute(
            path: 'expenses-entry',
            name: 'EXPENSES-ENTRY',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const ExpensesEntry(),
              );
            },
          ),
          GoRoute(
            path: 'income-entry',
            name: 'INCOME-ENTRY',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const IncomeEntry(),
              );
            },
          ),
        ]),

    //==STATEMENT
    GoRoute(
      path: '/statement',
      name: 'STATEMENT',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SelectAccountStatementScreen(),
      ),
      routes: [
        GoRoute(
          path: 'account-statement',
          name: 'ACCOUNT-STATEMENT',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const StatementScreen(),
          ),
        ),
      ],
    ),

    //==REPORT
    GoRoute(
      path: '/reports',
      name: 'REPORTS',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ReportScreen(),
      ),
      routes: [
        GoRoute(
          path: 'cash-book',
          name: 'CASH-BOOK',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const CashBookScreen(),
          ),
        ),
        GoRoute(
          path: 'bank-book',
          name: 'BANK-BOOK',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const BankBookScreen(),
          ),
        ),
      ],
    ),
  ],
);

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
