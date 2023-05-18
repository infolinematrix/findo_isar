import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/screen/statement/statement_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/util/constant.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({Key? key, required this.account}) : super(key: key);

  final AccountsModel account;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: Text(account.name!.toString().toUpperCase()),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: FormBuilder(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: inputHeight,
                                  child: FormBuilderDateRangePicker(
                                    name: 'date_range',
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime.now(),
                                    initialValue: DateTimeRange(
                                        start: ref.watch(startDateProvider),
                                        end: ref.watch(endDateProvider)),
                                    style: inputStyle,
                                    format: DateFormat('yyyy-MM-dd'),
                                    // onChanged: _onChanged,
                                    decoration: const InputDecoration(
                                      labelText: 'Date Range',
                                      iconColor: Colors.red,
                                      suffixIcon: Icon(Iconsax.calendar),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Amount",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        // Text(
                                        //   "12,650",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .titleMedium,
                                        // ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceMedium(),
                                    const Icon(Iconsax.import_1),
                                    UIHelper.horizontalSpaceMedium(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // Text(
                                        //   "Total Income",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .bodyMedium,
                                        // ),
                                        Text(
                                          "12,650",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Consumer(
                  //   builder: (context, ref, child) {
                  //     return const Text("sfsdf");
                  //   },
                  // )
                ],
              ),
            ),
            // body: SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            //     child: CustomScrollView(
            //       slivers: [
            //         SliverToBoxAdapter(
            //           child: Container(
            //             padding: const EdgeInsets.symmetric(horizontal: 16),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Theme.of(context).cardColor,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Expanded(
            //                   child: TextField(
            //                     decoration: const InputDecoration(
            //                       hintText: '12-Apr-2023 - 13-05-2023',
            //                       border: InputBorder.none,
            //                     ),
            //                     style:
            //                         Theme.of(context).textTheme.headlineMedium,
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Align(
            //                     alignment: Alignment.centerRight,
            //                     child: InkWell(
            //                       onTap: () => GoRouter.of(context).pop(),
            //                       child: const Icon(Iconsax.calendar, size: 32),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SliverToBoxAdapter(
            //           child: SizedBox(
            //             height: 8,
            //           ),
            //         ),
            //         SliverToBoxAdapter(
            //           child: Column(
            //             mainAxisSize: MainAxisSize.max,
            //             crossAxisAlignment: CrossAxisAlignment.stretch,
            //             children: [
            //               Container(
            //                 padding: const EdgeInsets.only(
            //                     left: 16, right: 16, top: 8, bottom: 8),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   // color: Theme.of(context).cardColor,
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text("45,644.52 DR",
            //                         style: Theme.of(context)
            //                             .textTheme
            //                             .headlineMedium),
            //                     Text(
            //                       "644.52 DR",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .headlineMedium!
            //                           .copyWith(
            //                             color:
            //                                 Theme.of(context).colorScheme.error,
            //                           ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 16,
            //               ),
            //               // Container(
            //               //   padding: const EdgeInsets.only(
            //               //       left: 16, right: 16, top: 16, bottom: 16),
            //               //   decoration: BoxDecoration(
            //               //     borderRadius: BorderRadius.circular(10),
            //               //     color: Theme.of(context).cardColor,
            //               //   ),
            //               // ),
            //               ListView.builder(
            //                 shrinkWrap: true,
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 itemCount: 10,
            //                 itemBuilder: (BuildContext context, int index) {
            //                   return null;

            //                   // return txnItem(context);
            //                 },
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
