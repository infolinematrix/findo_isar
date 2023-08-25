import 'package:findo_isar/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../theme/ui_helper.dart';
import '../../../../utils/currency_formatter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      pinned: false,
      stretch: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        // Add this code
        preferredSize: Size.fromHeight(90.0.h), // Add this code
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                strToDate(DateTime.now()),
                style: TextStyle(color: Theme.of(context).cardColor),
              ),
            ),
            IntrinsicHeight(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 8.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            "Income",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context).cardColor,
                                    ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatCurrency(data['debit'].toString()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).cardColor,
                                    ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              const Icon(
                                Iconsax.import_1,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: 50,
                        // child: DateWidget(
                        //   strDate: DateTime.now().toString(),
                        // ),
                        child: VerticalDivider(
                          thickness: 0.8,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            "Expenditure",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context).cardColor,
                                    ),
                          ),
                          UIHelper.verticalSpaceExtraSmall(),
                          Row(
                            children: [
                              Text(
                                formatCurrency(data['credit'].toString()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).cardColor,
                                    ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              Icon(
                                Iconsax.export_1,
                                color: Theme.of(context).colorScheme.error,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpaceMedium(),
          ],
        ), // Add this code
      ),
      flexibleSpace: InkWell(
        onTap: () => GoRouter.of(context).pushNamed("SEARCH"),
        child: Container(
          height: 45.h,
          margin: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.sp),
                bottomLeft: Radius.circular(30.sp),
                topRight: Radius.circular(30.sp),
                topLeft: Radius.circular(30.sp),
              ),
              side: BorderSide(width: 1, color: Theme.of(context).canvasColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Iconsax.search_normal),
                  const Expanded(child: SizedBox.shrink()),
                  Text("SEARCH", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return SliverToBoxAdapter(
    //   child: Container(
    //     // margin: EdgeInsets.only(top: 16.h),
    //     padding: EdgeInsets.symmetric(horizontal: 0.0.w),
    //     // padding: EdgeInsets.symmetric(horizontal: 8.0.w),
    //     child: InkWell(
    //       // onTap: () =>
    //       //     GoRouter.of(context).pushNamed("ACCOUNTS/SEARCH"),
    //       child: Container(
    //         height: 45.h,
    //         margin: EdgeInsets.symmetric(horizontal: 8.0.w),
    //         child: Card(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.only(
    //               bottomRight: Radius.circular(30.sp),
    //               bottomLeft: Radius.circular(30.sp),
    //               topRight: Radius.circular(30.sp),
    //               topLeft: Radius.circular(30.sp),
    //             ),
    //             side:
    //                 BorderSide(width: 1, color: Theme.of(context).canvasColor),
    //           ),
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 16.0.w),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 const Icon(Iconsax.search_normal),
    //                 const Expanded(child: SizedBox.shrink()),
    //                 Text("SEARCH",
    //                     style: Theme.of(context).textTheme.bodySmall),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
