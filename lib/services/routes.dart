import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_child_screen.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_parent_screen.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_bank_account.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_expense_account.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_liability_account.dart';
import 'package:flutter_wallet/ui/screen/onboard/onboard_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/bank_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/cash_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/report_screen.dart';
import 'package:flutter_wallet/ui/screen/settings/settings_screen.dart';
import 'package:flutter_wallet/ui/screen/statement/select_account_screen.dart';
import 'package:flutter_wallet/ui/screen/transactions/expenses_entry.dart';
import 'package:flutter_wallet/ui/screen/transactions/select_account.dart';
import 'package:go_router/go_router.dart';

import '../ui/screen/accounts/update/update_bank_account.dart';
import '../ui/screen/accounts/update/update_expense_account.dart';
import '../ui/screen/accounts/update/update_liability_account.dart';
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
        GoRoute(
          path: 'create-',
          name: 'CREATE-CHILD',
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
          path: 'create-bank-account',
          name: 'CREATE-BANK-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: CreateBankAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'create-expenses-coount',
          name: 'CREATE-EXPENSES-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: CreateExpensesAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'create-income-account',
          name: 'CREATE-INCOME-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: CreateExpensesAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'create-liability-account',
          name: 'CREATE-LIABILITY-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: CreateLiabilityAccount(
                  account: extra['account'],
                ));
          },
        ),

        //----MODIFY
        GoRoute(
          path: 'update-bank-account',
          name: 'UPDATE-BANK-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: UpdateBankAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'update-expenses-coount',
          name: 'UPDATE-EXPENSES-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: UpdateExpensesAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'update-income-account',
          name: 'UPDATE-INCOME-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: UpdateExpensesAccount(
                  account: extra['account'],
                ));
          },
        ),
        GoRoute(
          path: 'update-liablity-account',
          name: 'UPDATE-LIABLITY-ACCOUNT',
          pageBuilder: (context, state) {
            Map extra = state.extra! as Map;
            return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: UpdateLiabilityAccount(
                  account: extra['account'],
                ));
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
