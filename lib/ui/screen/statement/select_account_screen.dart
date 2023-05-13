import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SelectAccountStatementScreen extends StatelessWidget {
  const SelectAccountStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  stretch: true,
                  flexibleSpace: Container(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search..',
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Iconsax.search_normal, size: 24),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    // margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 18, bottom: 16),
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: ListTile(
                            onTap: () => GoRouter.of(context)
                                .pushNamed('ACCOUNT-STATEMENT'),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                child: Text(
                                  "A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              "Account Head",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            subtitle: Text(
                              "Short description of account",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: const Icon(Iconsax.arrow_21),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // body: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.max,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Container(
        //           padding: const EdgeInsets.only(
        //               left: 18, right: 18, top: 4, bottom: 4),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Theme.of(context).cardColor,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Expanded(
        //                 child: TextField(
        //                   decoration: const InputDecoration(
        //                     hintText: 'Search..',
        //                     border: InputBorder.none,
        //                   ),
        //                   style: Theme.of(context).textTheme.headlineMedium,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: Align(
        //                   alignment: Alignment.centerRight,
        //                   child: InkWell(
        //                     onTap: () => GoRouter.of(context).pop(),
        //                     child:
        //                         const Icon(Iconsax.close_circle, size: 32),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         const SizedBox(height: 16),
        //         Expanded(
        //           child: Container(
        //             padding: const EdgeInsets.only(
        //                 left: 0, right: 0, top: 18, bottom: 18),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Theme.of(context).cardColor,
        //             ),
        //             child: ListView.builder(
        //               itemCount: 10,
        //               shrinkWrap: true,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return ListTile(
        //                   onTap: () => GoRouter.of(context)
        //                       .pushNamed('ACCOUNT-STATEMENT'),
        //                   leading: Container(
        //                     width: 50,
        //                     height: 50,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(8),
        //                       color: Theme.of(context).secondaryHeaderColor,
        //                     ),
        //                     child: Center(
        //                       child: Text(
        //                         "A",
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .titleLarge!
        //                             .copyWith(fontWeight: FontWeight.bold),
        //                       ),
        //                     ),
        //                   ),
        //                   title: Text(
        //                     "Account Head",
        //                     style: Theme.of(context).textTheme.titleMedium,
        //                   ),
        //                   subtitle: Text(
        //                     "Short description of account",
        //                     style: Theme.of(context).textTheme.bodySmall,
        //                   ),
        //                   trailing: const Icon(Iconsax.arrow_21),
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
