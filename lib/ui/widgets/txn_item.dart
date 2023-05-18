import 'package:flutter/material.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';

import '../../util/format_currency.dart';
import 'date_widget.dart';

Widget txnItem(BuildContext context, TransactionsModel txn) {
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).cardColor,
    ),
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
            UIHelper.verticalSpaceMedium(),
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
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    // txn.accountName!,
                    txn.description!,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                  ),
                  // Text(
                  //   txn.description != null
                  //       ? txn.description!
                  //       : 'No description found.',
                  //   maxLines: 1,
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyLarge!
                  //       .copyWith(fontWeight: FontWeight.normal),
                  // ),
                  Text(
                    txn.accountName!,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${formatCurrency(txn.amount.toString())}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          // fontWeight: FontWeight.normal,
                          // color: txn.txnType == TxnType.CR
                          //     ? Theme.of(context).primaryColorDark
                          //     : Theme.of(context).primaryColorLight,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
