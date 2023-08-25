import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class HomeTabWithFloatingButton extends StatefulWidget {
//   const HomeTabWithFloatingButton({super.key});

//   @override
//   State<HomeTabWithFloatingButton> createState() =>
//       _HomeTabWithFloatingButtonState();
// }

// class _HomeTabWithFloatingButtonState extends State<HomeTabWithFloatingButton> {
//   int counter = 0;
//   ScrollController? hideButtonController;

//   var isVisible = false;

//   @override
//   initState() {
//     super.initState();
//     isVisible = true;
//     hideButtonController = ScrollController();
//     hideButtonController?.addListener(() {
//       if (hideButtonController?.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (isVisible == true) {
//           /* only set when the previous state is false
//              * Less widget rebuilds
//              */
//           // print("**** $isVisible up"); //Move IO away from setState
//           setState(() {
//             isVisible = false;
//           });
//         }
//       } else {
//         if (hideButtonController!.position.userScrollDirection ==
//             ScrollDirection.forward) {
//           if (isVisible == false) {
//             /* only set when the previous state is false
//                * Less widget rebuilds
//                */
//             // print("**** $isVisible down"); //Move IO away from setState
//             setState(() {
//               isVisible = true;
//             });
//           }
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final p = {'name': 'SUBHA'};
//     return Scaffold(
//       // floatingActionButton: Visibility(
//       //   visible: isVisible,
//       //   child: FloatingActionButton(
//       //     backgroundColor: Theme.of(context).primaryColor,
//       //     foregroundColor: Theme.of(context).canvasColor,
//       //     // shape: const BeveledRectangleBorder(
//       //     //     borderRadius: BorderRadius.all(Radius.zero)),
//       //     onPressed: () async {
//       //       return transactionTypesPopoup(context);
//       //     },
//       //     tooltip: 'Increment',
//       //     child: const Icon(Icons.add),
//       //   ),
//       // ),
//       body: CustomScrollView(
//         controller: hideButtonController!,
//         slivers: [
//           const SearchBar(),

//           const RecentTransactionsHead(),
//           SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),

//           SliverToBoxAdapter(
//             child: Consumer(
//               builder: (context, ref, child) {
//                 final data = ref.watch(totalIncomeExpenditureProvider(p));
//                 return data.when(
//                   error: (error, stackTrace) => ErrorWidget(error),
//                   loading: () => const LinearProgressIndicator(),
//                   data: (data) {
//                     return currentMonthSummary(context, data);
//                   },
//                 );
//               },
//             ),
//           ),

//           // Consumer(
//           //   builder: (context, ref, child) {
//           //     final data = ref.watch(totalIncomeExpenditureProvider(p));

//           //     return SliverToBoxAdapter(
//           //       child: data.when(
//           //         error: (error, stackTrace) => ErrorWidget(error),
//           //         loading: () => const LinearProgressIndicator(),
//           //         data: (data) {
//           //           return currentMonthSummary(context, data);
//           //         },
//           //       ),
//           //     );
//           //   },
//           // ),

//           SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
//           //-- RECENT TRANSACTIONS
//           Consumer(builder: (context, ref, child) {
//             final txns = ref.watch(recentTransactionsProvider);
//             return txns.when(
//               error: (error, stackTrace) => ErrorWidget(error),
//               loading: () => SliverToBoxAdapter(
//                 child: UIHelper.verticalSpaceMedium(),
//               ),
//               data: (data) {
//                 return SliverFixedExtentList(
//                   itemExtent: 65.h, // I'm forcing item heights
//                   delegate: SliverChildBuilderDelegate(childCount: data.length,
//                       (context, index) {
//                     return TransactionItem(txn: data[index]);
//                   }),
//                 );
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

//------------------------------------------------
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final p = {
    //   'startDate': firstDayOfMonth(DateTime.now()),
    //   'endDate': lastDayOfMonth(DateTime.now())
    // };
    return Scaffold(
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).canvasColor,
          // shape: const BeveledRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.zero)),
          onPressed: () async {
            // return await transactionTypesPopoup(context);
            // return await txnPopup(context);
            GoRouter.of(context).pushNamed('TXN_GATE');
          },
          tooltip: 'Transaction',
          child: const Icon(Icons.add),
        ),
      ),
      body: const Placeholder(
        color: Colors.transparent,
        // child: CustomScrollView(
        //   slivers: [
        //     const SearchBar(),
        //     SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
        //     const RecentTransactionsHead(),

        //     SliverToBoxAdapter(child: UIHelper.verticalSpaceSmall()),
        //     SliverToBoxAdapter(
        //       child: Consumer(
        //         builder: (context, ref, child) {
        //           final data = ref.watch(totalIncomeExpenditureProvider(p));
        //           return data.when(
        //             error: (error, stackTrace) => ErrorWidget(error),
        //             loading: () => const LinearProgressIndicator(),
        //             data: (data) {
        //               return currentMonthSummary(context, data);
        //             },
        //           );
        //         },
        //       ),
        //     ),
        //     SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
        //     //-- RECENT TRANSACTIONS
        //     Consumer(builder: (context, ref, child) {
        //       final txns = ref.watch(recentTransactionsProvider);
        //       return txns.when(
        //         error: (error, stackTrace) => ErrorWidget(error),
        //         loading: () => SliverToBoxAdapter(
        //           child: UIHelper.verticalSpaceMedium(),
        //         ),
        //         data: (data) {
        //           return data.isNotEmpty
        //               ? SliverFixedExtentList(
        //                   itemExtent: 65.h, // I'm forcing item heights
        //                   delegate: SliverChildBuilderDelegate(
        //                       childCount: data.length, (context, index) {
        //                     return TransactionItem(txn: data[index]);
        //                   }),
        //                 )
        //               : SliverToBoxAdapter(
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 16.w),
        //                     child: const BoxedContainer(
        //                       child: Text("Recent transaction\nNo data found"),
        //                     ),
        //                   ),
        //                 );
        //         },
        //       );
        //     }),

        //     //-- END OF RECENT
        //   ],
        // ),
        // child: Consumer(
        //   builder: (context, ref, child) {
        //     // final homeData = ref.watch(homeProvider);
        //     // return homeData.when(
        //     //   error: (error, stackTrace) => ErrorWidget(error),
        //     //   loading: () => const Center(child: CircularProgressIndicator()),
        //     //   data: (data) {
        //     //     return CustomScrollView(
        //     //       slivers: [
        //     //         const SearchBar(),
        //     //         const RecentTransactionsHead(),
        //     //         SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
        //     //         SliverFixedExtentList(
        //     //           itemExtent: 65.h, // I'm forcing item heights
        //     //           delegate: SliverChildBuilderDelegate(
        //     //               childCount: data?.recentTransactions.length,
        //     //               (context, index) {
        //     //             return TransactionItem(
        //     //                 txn: data?.recentTransactions[index]);
        //     //           }),
        //     //         ),
        //     //       ],
        //     //     );
        //     //   },
        //     // );
        //   },
        // ),
      ),
    );
  }
}
