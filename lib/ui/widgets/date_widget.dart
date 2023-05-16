import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/date_utils.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';

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
                color: Theme.of(context).highlightColor,
                // color: Color(randomColor[
                //     randomNumber(min: 0, max: randomColor.length - 1)]),
              ),
              child: Column(
                children: [
                  Text(
                    date['day'],
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColorDark),
                  ),
                  Text(
                    date['month'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12, height: 1.00),
                  ),
                  Text(
                    date['year'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 8, height: 1.0),
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
                  colorFilter:
                      const ColorFilter.mode(Colors.green, BlendMode.srcIn),
                  width: 18,
                ),
              )
            : Positioned(
                right: 15,
                top: 0,
                child: SvgPicture.asset("assets/svg/payment.svg",
                    width: 18,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn)),
              ),
      ],
    );
  }
}