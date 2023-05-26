import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/ui/screen/transactions/transaction_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/util/format_currency.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:go_router/go_router.dart';

import '../../../util/dialog.dart';
import '../home/home_controller.dart';
import '../statement/statement_controller.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({Key? key, required this.txn})
      : super(key: key);

  final TransactionsModel txn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TXN #${txn.id}"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.red,
                              label: Text(
                                "DEBIT",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context).canvasColor),
                              ),
                            ),
                            Text(
                              formatCurrency(txn.amount.toString()),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Text(
                          txn.accountName.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          txn.description.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        UIHelper.verticalSpaceMedium(),
                        const Divider(),
                        UIHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.green,
                              label: Text(
                                "CREDIT",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context).canvasColor),
                              ),
                            ),
                            Text(
                              formatCurrency(txn.amount.toString()),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Text(
                          txn.onAccountName.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          txn.narration.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                //---------
                Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.background,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Warning!",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "If you delete the transaction, you will no longer get the transaction detail.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Be sure, you want to delete the data",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                                onPressed: () async {
                                  AlertAction? action = await confirmDialog(
                                      context,
                                      "WARNING\nDelete Transaction entry?");

                                  if (action == AlertAction.ok) {
                                    await ref
                                        .watch(deleteTxnProvider(txn.id).future)
                                        .then((value) {
                                      EasyLoading.showToast("Deleted..");
                                      //--Reload Home Data
                                      ref.invalidate(
                                          recentTransactionsProvider);
                                      ref.invalidate(
                                          transactionsProvider(txn.accountNo));
                                      GoRouter.of(context).pop();
                                    });
                                  }
                                },
                                child: const Text("Delete"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
