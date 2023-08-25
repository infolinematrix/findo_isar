import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/models/transactions_model.dart';
import '../../theme/ui_helper.dart';
import '../../utils/currency_formatter.dart';
import 'date_widget.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.txn,
  }) : super(key: key);

  final TransactionsModel? txn;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => GoRouter.of(context)
          .pushNamed("TXN_DETAIL", extra: {'scrollNo': txn!.scrollNo}),
      leading: DateWidget(
          strDate: txn!.txnDate != null
              ? txn!.txnDate.toString()
              : txn!.createdAt.toString()),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#${txn!.scrollNo} - ${txn!.txnType == TxnType.DR ? 'Expenditure' : 'Income'}",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Flexible(
            child: Text(
              txn!.description.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txn!.txnType == TxnType.CR
                    ? Icon(
                        Iconsax.import_2, //export_3
                        size: 12.sp, color: Colors.green,
                      )
                    : Icon(
                        Iconsax.export_3, //import_2
                        size: 12.sp, color: Colors.red,
                      ),
                UIHelper.horizontalSpaceExtraSmall(),
                Text(
                  txn!.accountName!,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${formatCurrency(txn!.amount.toString())}",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: txn!.txnType == TxnType.DR
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).primaryColorDark),
          ),
          Text(
            txn!.narration!,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
