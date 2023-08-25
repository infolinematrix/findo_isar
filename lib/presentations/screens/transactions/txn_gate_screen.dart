import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../app/constants/variables.dart';
import '../../../theme/colors.dart';
import '../../../theme/ui_helper.dart';
import '../../../utils/utilities.dart';

class TransactionGate extends StatelessWidget {
  const TransactionGate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0.sp),
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0.sp),
            topLeft: Radius.circular(20.0.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UIHelper.verticalSpaceMedium(),
            InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed('TXN_SELECT_ACCOUNT',
                    extra: {'txnType': 'EXPENDITURE'});

                // GoRouter.of(context).pop();
              },
              child: ListTile(
                leading: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Color(randomColor[
                        randomNumber(min: 0, max: randomColor.length - 1)]),
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.import_1,
                      size: 24.sp,
                    ),
                  ),
                ),
                title: Text(
                  "EXPENSES",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Make payment to party for for goods, or services provided by them.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Divider(color: Theme.of(context).hoverColor),
            InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed('TXN_SELECT_ACCOUNT',
                    extra: {'txnType': 'INCOME'});

                GoRouter.of(context).pop();
              },
              child: ListTile(
                leading: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Color(randomColor[
                        randomNumber(min: 0, max: randomColor.length - 1)]),
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.export_1,
                      // color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                title: Text(
                  "INCOME",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Receive money from party for for goods, or services provided by you.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Divider(color: Theme.of(context).hoverColor),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Color(randomColor[
                        randomNumber(min: 0, max: randomColor.length - 1)]),
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.empty_wallet_change,
                      // color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                title: Text(
                  "TRANSFER",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Receive money from party for for goods, or services provided by you.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Divider(color: Theme.of(context).hoverColor),
          ],
        ),
      ),
    );
  }
}
