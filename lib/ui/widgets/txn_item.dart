import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget txnItem(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).cardColor,
      // color: const Color(0xffF1F3F6),
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
              child: Stack(
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
                        ),
                        child: Column(
                          children: [
                            Text(
                              "24",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Text(
                              "APRIL",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 10, height: 1.0),
                            ),
                            Text(
                              "2003",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 7),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Text(
                      //   "April 2023",
                      //   textAlign: TextAlign.center,
                      //   style: Theme.of(context).textTheme.bodyLarge,
                      // ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: SvgPicture.asset(
                      "assets/svg/income.svg",
                      width: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "# 123 - ICICI Bank",
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Vegitable Purchased by Cash",
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Househole Expenses Purchased by Cash",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
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
                      "12,500.00",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          "Vegitable Purchased by Cash",
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
