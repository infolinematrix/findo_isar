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
                    items: ref
                        .read(yearsListProvider)
                        .map((year) => DropdownMenuItem<int>(
                              value: year,
                              child: Text(
                                "$year  # January ~ December",
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
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        ref.watch(selectedYearProvider.notifier).update(
                            (state) => formKey.currentState!.value['year']);
                      }
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
                              ref.watch(totalIncomeProvider).toString()),
                          style: Theme.of(context).textTheme.titleMedium,
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
                              ref.watch(totalExpenditureProvider).toString()),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    // UIHelper.horizontalSpaceLarge(),
                    // Wrap(
                    //   direction: Axis.vertical,
                    //   crossAxisAlignment: WrapCrossAlignment.end,
                    //   children: [
                    //     Text(
                    //       "SAVINGS",
                    //       textAlign: TextAlign.right,
                    //       style: Theme.of(context).textTheme.labelSmall,
                    //     ),
                    //     Text(
                    //       formatCurrency(
                    //           ref.watch(totalDebitProvider).toString()),
                    //       style: Theme.of(context).textTheme.titleLarge,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(mySavingsProvider);

            return data.when(
              error: (error, stackTrace) => ErrorWidget(error),
              loading: () => const SliverToBoxAdapter(
                child: LinearProgressIndicator(),
              ),
              data: (data) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
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
                                        months[data[index]['month']],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(data[index]['year'].toString()),
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
                                        formatCurrency(
                                            data[index]['income'].toString()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
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
                                        formatCurrency(data[index]
                                                ['expenditure']
                                            .toString()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
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
                                      formatCurrency(
                                          data[index]['savings'].toString()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: data[index]['savings'] < 0
                                                  ? Colors.red
                                                  : Colors.black),
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
                    childCount: data.length,
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
