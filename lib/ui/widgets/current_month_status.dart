import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CurrentMonthStatus extends StatelessWidget {
  const CurrentMonthStatus({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "12th, April 2023",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          IntrinsicHeight(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Expenses",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4,152.25",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      // fontWeight: FontWeight.bold,
                                      // color: Theme.of(context).cardColor,
                                      ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Iconsax.export_1,
                              color: Colors.red,
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
                    fit: FlexFit.tight,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Income",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4,152.25",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      // fontWeight: FontWeight.bold,
                                      // color: Theme.of(context).cardColor,
                                      ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Iconsax.import_1,
                              color: Colors.green,
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
          const SizedBox(
            height: 16,
          ),
        ],
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
