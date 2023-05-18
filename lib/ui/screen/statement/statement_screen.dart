import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/screen/statement/statement_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/ui/widgets/input_container.dart';
import 'package:flutter_wallet/util/constant.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

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
                                  child: InputContainer(
                                    child: FormBuilderDateRangePicker(
                                      name: 'date_range',
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 1)),
                                      initialValue: DateTimeRange(
                                          start: ref.watch(startDateProvider),
                                          end: ref.watch(endDateProvider)),
                                      style: inputStyle,
                                      format: DateFormat('dd-MM-yyyy'),
                                      // onChanged: _onChanged,
                                      decoration: const InputDecoration(
                                        labelText: 'Date Range',
                                        iconColor: Colors.red,
                                        suffixIcon: Icon(Iconsax.calendar),
                                      ),
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
                  SliverToBoxAdapter(
                    child: UIHelper.verticalSpaceMedium(),
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
