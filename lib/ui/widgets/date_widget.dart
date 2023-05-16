import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/date_utils.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';

import '../../util/constant.dart';
import '../../util/functions.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key, required this.txnData}) : super(key: key);

  final TransactionsModel txnData;

  @override
  Widget build(BuildContext context) {
    final date = dateMap(txnData.txnDate!);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              clipBehavior: Clip.hardEdge,
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Theme.of(context).highlightColor,
                color: Color(randomColor[
                    randomNumber(min: 0, max: randomColor.length - 1)]),
              ),
              child: Column(
                children: [
                  Text(
                    date['day'],
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  Text(
                    date['month'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 10, height: 1.0),
                  ),
                  Text(
                    date['year'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 7),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
          ],
        ),
        txnData.txnType == TxnType.CR
            ? Positioned(
                right: 15,
                top: 0,
                child: SvgPicture.asset(
                  "assets/svg/income.svg",
                  width: 18,
                ),
              )
            : Positioned(
                right: 15,
                top: 0,
                child: SvgPicture.asset(
                  "assets/svg/payment.svg",
                  width: 18,
                ),
              ),
      ],
    );
  }
}
