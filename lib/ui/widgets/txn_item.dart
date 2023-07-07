import 'package:flutter/material.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:go_router/go_router.dart';

import '../../util/format_currency.dart';
import 'date_widget.dart';

Widget txnItem(BuildContext context, TransactionsModel txn) {
  return Card(
    elevation: .20,
    child: InkWell(
      onTap: () =>
          GoRouter.of(context).pushNamed('TXN-DETAIL', extra: {'txn': txn}),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: DateWidget(txnData: txn),
                ),
                // UIHelper.horizontalSpaceMedium(),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "# ${txn.id} - ${txn.onAccountName}",
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        txn.description!,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        txn.accountName!,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColorDark,
                            ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${formatCurrency(txn.amount.toString())}",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    // color: txn.txnType == TxnType.CR
                                    //     ? Theme.of(context).primaryColorDark
                                    //     : Theme.of(context).colorScheme.onError,
                                  ),
                        ),
                        Text(
                          "${formatCurrency(txn.onAccountCurrentBalance.toString())}",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
