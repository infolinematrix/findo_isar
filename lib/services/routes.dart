import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_child_screen.dart';
import 'package:flutter_wallet/ui/screen/accounts/accounts_parent_screen.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_bank_account.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_expense_account.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_income_account.dart';
import 'package:flutter_wallet/ui/screen/accounts/create/create_liability_account.dart';
import 'package:flutter_wallet/ui/screen/onboard/onboard_screen.dart';
import 'package:flutter_wallet/ui/screen/pages/about_screen.dart';
import 'package:flutter_wallet/ui/screen/pages/pages_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/account_summary.dart';
import 'package:flutter_wallet/ui/screen/reports/bank_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/cash_book_screen.dart';
import 'package:flutter_wallet/ui/screen/reports/payment_book.dart';
import 'package:flutter_wallet/ui/screen/reports/receive_book.dart';
import 'package:flutter_wallet/ui/screen/reports/report_screen.dart';

import 'package:flutter_wallet/ui/screen/settings/settings_screen.dart';
import 'package:flutter_wallet/ui/screen/statement/select_account_screen.dart';
import 'package:flutter_wallet/ui/screen/transactions/cash_deposit_screen.dart';
import 'package:flutter_wallet/ui/screen/transactions/cash_withdrawal_screen.dart';
import 'package:flutter_wallet/ui/screen/transactions/expenses_entry.dart';
import 'package:flutter_wallet/ui/screen/transactions/transaction_detail.dart';

import 'package:go_router/go_router.dart';

import '../ui/screen/accounts/update/update_bank_account.dart';
import '../ui/screen/accounts/update/update_expense_account.dart';
import '../ui/screen/accounts/update/update_income_account.dart';
import '../ui/screen/accounts/update/update_liability_account.dart';
import '../ui/screen/consistency_check/consistency_check_screen.dart';
import '../ui/screen/home/home_page.dart';
import '../ui/screen/settings/backup/backup_screen.dart';
import '../ui/screen/settings/cash_in_hand/cash_in_hand_screen.dart';
import '../ui/screen/settings/configuration/configuration_screen.dart';
import '../ui/screen/statement/statement_screen.dart';
import '../ui/screen/transactions/income_entry.dart';
import '../ui/screen/transactions/selectable_account.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'ONBOARD',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OnBoardScreen(),
        // child: const SplashScreen()
      ),
    ),
    GoRoute(
      path: '/home',
      name: 'HOME',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HomePage(),
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
        routes: [
          GoRoute(
            path: 'config',
            name: 'CONFIG',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const ConfigurationScreen(),
              );
            },
          ),
          GoRoute(
            path: 'cash-in-hand',
            name: 'CASH-IN-HAND',
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const CashInHandScreen(),
              );
            },
          ),
          GoRoute(
            path: 'consistency-check',
            name: 'CONSISTENCY-CHECK',
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const ConsistencyCheckScreen(),
              );
            },
          ),
          GoRoute(
            path: 'backup',
            name: 'BACKUP',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const BackupScreen(),
              );
            },
          ),
        ]),

    //==ACCOUNTS
    GoRoute(
      path: '/root_accounts',
      name: 'ROOT_ACCOUNTS',
      pageBuilder: (context, state) {
        Map extra = state.extra! as Map;
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: AccountsParentScreen(
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
                child: CreateIncomeAccount(
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
                child: UpdateIncomeAccount(
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
            child: SelectableAccount(
              accountType: extra['accountType'],
            ),
          );
        },
        routes: [
          GoRoute(
            path: 'txn-detail',
            name: 'TXN-DETAIL',
            pageBuilder: (context, state) {
              Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: TransactionDetailScreen(
                  txn: extra['txn'],
                ),
              );
            },
          ),
          GoRoute(
            path: 'expenses-entry',
            name: 'EXPENSES-ENTRY',
            pageBuilder: (context, state) {
              Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: ExpensesEntry(
                  account: extra['account'],
                ),
              );
            },
          ),
          GoRoute(
            path: 'income-entry',
            name: 'INCOME-ENTRY',
            pageBuilder: (context, state) {
              Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: IncomeEntry(
                  account: extra['account'],
                ),
              );
            },
          ),
          //--Cash Withdrawal
          GoRoute(
            path: 'withdrawal-entry',
            name: 'WITHDRAWAL-ENTRY',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const CashWithdrawalScreen(),
              );
            },
          ),
          //--Cash Deposit
          GoRoute(
            path: 'deposit-entry',
            name: 'DEPOSIT-ENTRY',
            pageBuilder: (context, state) {
              // Map extra = state.extra! as Map;

              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const CashDepositScreen(),
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
            pageBuilder: (context, state) {
              Map extra = state.extra! as Map;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: StatementScreen(
                  account: extra['account'],
                ),
              );
            }),
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
        GoRoute(
          path: 'received-book',
          name: 'RECEIVED-BOOK',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const ReceivedBook(),
          ),
        ),
        GoRoute(
          path: 'payment-book',
          name: 'PAYMENT-BOOK',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const PaymentBook(),
          ),
        ),
        GoRoute(
          path: 'accounts-summary',
          name: 'ACCOUNTS-SUMMARY',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const AccountsSummary(),
          ),
        ),
      ],
    ),

    //==PAGES
    GoRoute(
      path: '/pages',
      name: 'PAGES',
      pageBuilder: (context, state) {
        // Map extra = state.extra! as Map;
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const PagesScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'about',
          name: 'ABOUT',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AboutScreen(),
            );
          },
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
