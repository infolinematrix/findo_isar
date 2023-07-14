import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:iconsax/iconsax.dart';

import '../../../util/constant.dart';
import '../../../util/date_utils.dart';
import '../../../util/format_currency.dart';
import '../../../util/ui_helpers.dart';
import 'reports_controller.dart';

class MySavingsScreen extends StatelessWidget {
  const MySavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return CustomScrollView(
      slivers: [
        Consumer(builder: (context, ref, child) {
          return FormBuilder(
            key: formKey,
            child: SliverAppBar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              expandedHeight: 100.0,
              pinned: true,
              snap: false,
              floating: true,
              title: const Text(
                "MY SAVINGS",
              ),
              bottom: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                title: SizedBox(
                  height: 40,
                  child: FormBuilderDropdown(
                    name: 'year',
                    initialValue: DateTime.now().year,
                    decoration: InputDecoration(
                      labelText: 'Select',
                      isDense: true,
                      filled: true,
                      fillColor: Theme.of(context).canvasColor,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      prefixIcon: const Icon(
                        Iconsax.calendar,
                        size: 24,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    style: inputStyle,
                    items: [2021, 2022, 2023]
                        .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(
                                "$year (January-December)",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      // if (formKey.currentState?.saveAndValidate() ?? false) {
                      //   DateTimeRange dateRange =
                      //       formKey.currentState!.value['date_range'];

                      //   ref
                      //       .watch(startDateProvider.notifier)
                      //       .update((state) => dateRange.start);

                      //   ref
                      //       .watch(endDateProvider.notifier)
                      //       .update((state) => dateRange.end);
                      // }
                    },
                    icon: const Icon(Iconsax.filter),
                    label: const Text("Filter"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                  UIHelper.horizontalSpaceMedium(),
                ],
              ),
            ),
          );
        }),
        SliverToBoxAdapter(
          child: Consumer(
            builder: (context, ref, child) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Theme.of(context).secondaryHeaderColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Total",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                          "INCOME",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          formatCurrency(
                              ref.watch(totalCreditProvider).toString()),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                          "EXPENDITURE",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          formatCurrency(
                              ref.watch(totalCreditProvider).toString()),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    UIHelper.horizontalSpaceLarge(),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                          "SAVINGS",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          formatCurrency(
                              ref.watch(totalDebitProvider).toString()),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // SliverToBoxAdapter(
        //   child: ListView.builder(
        //     itemCount: 12,
        //     itemBuilder: (BuildContext context, int index) {
        //       return const Card(
        //         elevation: .25,
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: Wrap(
        //                 direction: Axis.vertical,
        //                 clipBehavior: Clip.hardEdge,
        //                 children: [
        //                   Text("January"),
        //                   Text("2023"),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Card(
                  elevation: .25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            direction: Axis.vertical,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Text(
                                months[index],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Text("2023"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              const Text("Income"),
                              Text(
                                "2023",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              const Text("Expenditure"),
                              Text(
                                "2023",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          clipBehavior: Clip.hardEdge,
                          children: [
                            const Text("Savings"),
                            Text(
                              "2023",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            // 40 list items
            childCount: 12,
          ),
        ),
      ],
    );
  }
}
