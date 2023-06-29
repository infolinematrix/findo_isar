import 'package:flutter/material.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/date_utils.dart';
import 'package:iconsax/iconsax.dart';

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
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8),
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
                    style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(),
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
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 8,
                        height: 1.0,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (txnData.scrollType == ScrollType.HC ||
            txnData.scrollType == ScrollType.BC)
          const Positioned(
            right: 15,
            top: 0,
            child: Icon(
              Iconsax.minus_square5,
              color: Colors.red,
              size: 18,
            ),
          )
        else if (txnData.scrollType == ScrollType.HD ||
            txnData.scrollType == ScrollType.BD)
          const Positioned(
            right: 15,
            top: 0,
            child: Icon(
              Iconsax.add_square5,
              color: Colors.green,
              size: 18,
            ),
          )
        else if (txnData.scrollType == ScrollType.TD)
          const Positioned(
            right: 5,
            top: 0,
            child: Icon(
              Iconsax.arrange_square_25,
              color: Colors.blue,
              size: 18,
            ),
          )
        else if (txnData.scrollType == ScrollType.TC)
          const Positioned(
            right: 20,
            top: 0,
            child: Icon(
              Iconsax.arrange_square_25,
              color: Colors.blue,
              size: 18,
            ),
          )
      ],
    );
  }
}
