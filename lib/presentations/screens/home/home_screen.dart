import 'package:findo_isar/presentations/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../app/constants/variables.dart';
import '../../../theme/ui_helper.dart';
import '../../../utils/double_back_to_close_app.dart';
import '../../../utils/utilities.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/transaction_types_popup.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text(
              "FINDO",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.notification,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          floatingActionButton: Visibility(
            visible: true,
            child: Container(
              margin: EdgeInsets.only(bottom: 32.h, right: 16.w),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).canvasColor,
                // shape: const BeveledRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.zero)),

                onPressed: () async {
                  // return await transactionTypesPopoup(context);
                  return await txnPopup(context);
                  // GoRouter.of(context).pushNamed('TXN_GATE');
                },
                tooltip: 'Transaction',
                child: const Icon(Icons.add),
              ),
            ),
          ),
          bottomSheet: menu(context, 0),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text('Tap back again to leave'),
            ),
            // child: const TabBarView(
            //   children: [
            //     HomeTab(),
            //     TransactionTab(),
            //     ReportsTab(),
            //     SettingsTab(),
            //   ],
            // ),
            // child: const CustomScrollView(
            //   slivers: [],
            // ),
            child: Consumer(
              builder: (context, ref, child) {
                final homeData = ref.watch(inttHomeProvider);
                return homeData.when(
                  error: (error, stackTrace) => ErrorWidget(error),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (data) {
                    return CustomScrollView(
                      slivers: [
                        // SearchBar(data: data.todaysIncomeExpenditure),
                        // RecentTransactionsHead(
                        //     data: data.todaysIncomeExpenditure),

                        // SliverToBoxAdapter(
                        //   child: Container(
                        //     padding: EdgeInsets.all(16.0.sp),
                        //     child: ListView.builder(
                        //       itemCount: 7,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return SizedBox(
                        //           height: 100,
                        //           child: BoxedContainer(
                        //             child: Column(
                        //               children: const [
                        //                 Text("sads"),
                        //               ],
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),

                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8.w),
                                  width: ScreenUtil().screenWidth - 16.w,
                                  height: 100,
                                  child: Card(
                                    color: Color(randomColor[randomNumber(
                                        min: 0, max: randomColor.length - 1)]),
                                    elevation: .20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0.sp)),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "This month",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                              const Text("View")
                                            ],
                                          ),
                                          UIHelper.verticalSpaceMedium(),
                                          IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Flexible(
                                                  child: Text("sad"),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Wrap(
                                                    direction: Axis.vertical,
                                                    children: [
                                                      Text(
                                                        "Income",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .hintColor,
                                                            ),
                                                      ),
                                                      // UIHelper
                                                      //     .verticalSpaceExtraSmall(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "553",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineMedium!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          UIHelper
                                                              .horizontalSpaceSmall(),
                                                          Icon(
                                                            Iconsax.import_1,
                                                            color: Theme.of(
                                                                    context)
                                                                .hoverColor,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Flexible(
                                                  fit: FlexFit.tight,
                                                  child: VerticalDivider(
                                                    thickness: 0.8,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Wrap(
                                                    direction: Axis.vertical,
                                                    children: [
                                                      Text(
                                                        "Expenditure",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .hintColor,
                                                            ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "553",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineLarge!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          UIHelper
                                                              .horizontalSpaceSmall(),
                                                          Icon(
                                                            Iconsax.export_1,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .error,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        SliverToBoxAdapter(
                            child: UIHelper.verticalSpaceMedium()),

                        SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "RECENT TRANSACTIONS",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        )),
                        SliverToBoxAdapter(
                            child: UIHelper.verticalSpaceMedium()),
                        SliverFixedExtentList(
                          itemExtent: 65.h, // I'm forcing item heights
                          delegate: SliverChildBuilderDelegate(
                              childCount: data.recentTransactions.length,
                              (context, index) {
                            return TransactionItem(
                                txn: data.recentTransactions[index]);
                          }),
                        ),
                        SliverToBoxAdapter(child: UIHelper.verticalSpace(50.h))
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Widget menu(BuildContext context) {
//   return Container(
//     color: colorBackground,
//     height: 50.h,
//     child: TabBar(
//       labelColor: Colors.black,
//       unselectedLabelColor: Colors.black45,
//       indicatorSize: TabBarIndicatorSize.tab,
//       indicatorPadding: const EdgeInsets.all(0.0),
//       indicatorColor: Colors.transparent,
//       dividerColor: Colors.transparent,
//       tabs: [
//         Tab(
//           text: "Home",
//           icon: Icon(
//             Icons.euro_symbol,
//             size: 16.sp,
//           ),
//         ),
//         Tab(
//           text: "Transaction",
//           icon: Icon(
//             Icons.assignment,
//             size: 16.sp,
//           ),
//         ),
//         Tab(
//           text: "Reports",
//           icon: Icon(
//             Icons.account_balance_wallet,
//             size: 16.sp,
//           ),
//         ),
//         Tab(
//           text: "Settings",
//           icon: Icon(
//             Icons.settings,
//             size: 16.sp,
//           ),
//         ),
//       ],
//     ),
//   );
// }
