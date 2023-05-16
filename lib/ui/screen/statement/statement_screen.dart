import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("ICICI BANK LIMITED"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),

                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: '12-Apr-2023 - 13-05-2023',
                                  border: InputBorder.none,
                                ),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () => GoRouter.of(context).pop(),
                                  child: const Icon(Iconsax.calendar, size: 32),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 8,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Theme.of(context).cardColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("45,644.52 DR",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text(
                                  "644.52 DR",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // Container(
                          //   padding: const EdgeInsets.only(
                          //       left: 16, right: 16, top: 16, bottom: 16),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Theme.of(context).cardColor,
                          //   ),
                          // ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return null;

                              // return txnItem(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // child: Column(
                //   mainAxisSize: MainAxisSize.max,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.only(
                //           left: 18, right: 18, top: 8, bottom: 0),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Theme.of(context).cardColor,
                //       ),
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Expanded(
                //                 child: TextField(
                //                   decoration: const InputDecoration(
                //                     hintText: '12-Apr-2023 - 13-05-2023',
                //                     border: InputBorder.none,
                //                   ),
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headlineMedium,
                //                 ),
                //               ),
                //               Expanded(
                //                 child: Align(
                //                   alignment: Alignment.centerRight,
                //                   child: InkWell(
                //                     onTap: () => GoRouter.of(context).pop(),
                //                     child:
                //                         const Icon(Iconsax.calendar, size: 32),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 8,
                //           ),
                //           const Divider(),
                //           Container(
                //             // // height: 50,
                //             padding: const EdgeInsets.symmetric(vertical: 8),
                //             // decoration: BoxDecoration(
                //             //   borderRadius: BorderRadius.circular(10),
                //             //   color: Theme.of(context).cardColor,
                //             // ),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text("45,644.52 DR",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .headlineMedium),
                //                 Text(
                //                   "644.52 DR",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headlineMedium!
                //                       .copyWith(
                //                         color:
                //                             Theme.of(context).colorScheme.error,
                //                       ),
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     const SizedBox(height: 16),
                //     Expanded(
                //       child: Container(
                //         child: ListView.separated(
                //           itemCount: 10,
                //           shrinkWrap: true,
                //           separatorBuilder: (context, index) =>
                //               const Divider(height: 1),
                //           itemBuilder: (BuildContext context, int index) {
                //             return txnItem(context);
                //           },
                //         ),
                //       ),
                //     ),
                //     const SizedBox(height: 16),
                //   ],
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
