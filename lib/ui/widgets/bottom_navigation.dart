import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

Widget menu(BuildContext context, int index) {
  return Container(
    color: Theme.of(context).canvasColor,
    height: 50.h,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox.fromSize(
            size: const Size(50, 50),
            child: Material(
              // color: Colors.amberAccent,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Iconsax.home,
                      color: Theme.of(context).colorScheme.error,
                    ), // <-- Icon
                    Text(
                      "HOME",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox.fromSize(
            size: const Size(50, 50),
            child: Material(
              // color: Colors.amberAccent,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Iconsax.import,
                      color: Theme.of(context).colorScheme.error,
                    ),

                    /// <-- Icon
                    Text(
                      "ENTRY",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox.fromSize(
            size: const Size(50, 50),
            child: Material(
              // color: Colors.amberAccent,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Iconsax.add,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    Text(
                      "REPORT",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox.fromSize(
            size: const Size(50, 50),
            child: Material(
              // color: Colors.amberAccent,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Iconsax.copyright,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    Text(
                      "SETTINGS",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
  // return Container(
  //   color: colorBackground,
  //   height: 50.h,
  //   child: TabBar(
  //     labelColor: Colors.black,
  //     unselectedLabelColor: Colors.black45,
  //     indicatorSize: TabBarIndicatorSize.tab,
  //     indicatorPadding: const EdgeInsets.all(0.0),
  //     indicatorColor: Colors.transparent,
  //     dividerColor: Colors.transparent,
  //     onTap: (value) {
  //       switch (value) {
  //         case 0:
  //           // GoRouter.of(context).pop();
  //           // GoRouter.of(context).pop();
  //           break;

  //         case 1:
  //           // GoRouter.of(context).pop();
  //           GoRouter.of(context).pushNamed("TXN_GATE");
  //           break;
  //       }
  //     },
  //     tabs: [
  //       Tab(
  //         text: "Home",
  //         icon: Icon(
  //           Icons.euro_symbol,
  //           size: 16.sp,
  //         ),
  //       ),
  //       Tab(
  //         text: "Transaction",
  //         icon: Icon(
  //           Icons.assignment,
  //           size: 16.sp,
  //         ),
  //       ),
  //       Tab(
  //         text: "Reports",
  //         icon: Icon(
  //           Icons.account_balance_wallet,
  //           size: 16.sp,
  //         ),
  //       ),
  //       Tab(
  //         text: "Settings",
  //         icon: Icon(
  //           Icons.settings,
  //           size: 16.sp,
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
