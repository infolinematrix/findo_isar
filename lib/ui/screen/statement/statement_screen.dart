import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/screen/statement/statement_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../../util/format_currency.dart';
import '../../widgets/button_default.dart';
import '../../widgets/txn_item.dart';

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
              padding:
                  const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Container(
                          // height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: FormBuilder(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: FormBuilderDateRangePicker(
                                        name: 'date_range',
                                        firstDate: DateTime(2023),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 1)),
                                        initialValue: DateTimeRange(
                                          start: ref.watch(startDateProvider),
                                          end: DateTime.now(),
                                        ),
                                        style: inputStyle,
                                        format: DateFormat('dd-MMM-yyyy'),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          labelText: 'Date Range',
                                          iconColor: Colors.red,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          prefixIcon: Icon(
                                            Iconsax.calendar,
                                            size: 24,
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceSmall(),
                                    Expanded(
                                        flex: 3,
                                        child: ButtonDefault(
                                          text: "Filter",
                                          onTap: () {
                                            if (formKey.currentState
                                                    ?.saveAndValidate() ??
                                                false) {
                                              DateTimeRange dateRange = formKey
                                                  .currentState!
                                                  .value['date_range'];

                                              ref
                                                  .watch(startDateProvider
                                                      .notifier)
                                                  .update((state) =>
                                                      dateRange.start);

                                              ref
                                                  .watch(
                                                      endDateProvider.notifier)
                                                  .update(
                                                      (state) => dateRange.end);
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      UIHelper.horizontalSpaceMedium(),
                                      Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        children: [
                                          Text(
                                            "CREDIT",
                                            textAlign: TextAlign.right,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          Text(
                                            formatCurrency(ref
                                                .watch(totalCreditProvider)
                                                .toString()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ],
                                      ),
                                      UIHelper.horizontalSpaceLarge(),
                                      Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        children: [
                                          Text(
                                            "DEBIT",
                                            textAlign: TextAlign.right,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          Text(
                                            formatCurrency(ref
                                                .watch(totalDebitProvider)
                                                .toString()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ],
                                      ),

                                      // Column(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.end,
                                      //   children: [
                                      //     Wrap(
                                      //       direction: Axis.vertical,
                                      //       crossAxisAlignment:
                                      //           WrapCrossAlignment.end,
                                      //       children: [
                                      //         const Text(
                                      //           "DEBIT",
                                      //           textAlign: TextAlign.right,
                                      //         ),
                                      //         Text(
                                      //           "12,650",
                                      //           style: Theme.of(context)
                                      //               .textTheme
                                      //               .titleMedium,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Wrap(
                                      //       direction: Axis.vertical,
                                      //       crossAxisAlignment:
                                      //           WrapCrossAlignment.end,
                                      //       children: [
                                      //         const Text(
                                      //           "DEBIT",
                                      //           textAlign: TextAlign.right,
                                      //         ),
                                      //         Text(
                                      //           "12,650",
                                      //           style: Theme.of(context)
                                      //               .textTheme
                                      //               .titleMedium,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final data = ref.watch(transactionsProvider(account.id));

                      return data.when(
                        data: (data) {
                          return SliverList.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return txnItem(context, data[index]);
                            },
                          );
                        },
                        error: (error, stackTrace) => ErrorWidget(error),
                        loading: () => const SliverToBoxAdapter(
                          child: LinearProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
