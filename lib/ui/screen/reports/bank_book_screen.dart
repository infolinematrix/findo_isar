import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../../util/format_currency.dart';
import '../../../util/ui_helpers.dart';
import '../../widgets/txn_item.dart';
import 'reports_controller.dart';

class BankBookScreen extends StatelessWidget {
  const BankBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return CustomScrollView(
      slivers: [
        FormBuilder(
          key: formKey,
          child: SliverAppBar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            expandedHeight: 160.0,
            pinned: true,
            snap: false,
            floating: true,
            title: const Text(
              "BANK BOOK",
            ),
            flexibleSpace: Consumer(builder: (context, ref, child) {
              final banks = ref.watch(bankAccountsProvider);

              return banks.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => const Text("Error"),
                data: (banks) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 90, left: 16, right: 16),
                    child: SizedBox(
                      height: 45,
                      child: FormBuilderDropdown<int>(
                        name: 'bank',
                        decoration: InputDecoration(
                            labelText: 'Select Bank',
                            isDense: true,
                            filled: true,
                            fillColor: Theme.of(context).canvasColor,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: const Icon(
                              Iconsax.bank,
                              size: 24,
                            )),
                        items: banks
                            .map(
                              (item) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: item.id,
                                child: Text(
                                  item.name!,
                                  style: inputStyle,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          ref
                              .watch(selectedAccount.notifier)
                              .update((state) => value!);
                        },
                      ),
                    ),
                  );
                },
              );
            }),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              title: Consumer(
                builder: (context, ref, child) {
                  return SizedBox(
                    height: 40,
                    child: FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(2023),
                      lastDate: DateTime.now().add(const Duration(days: 1)),
                      initialValue: DateTimeRange(
                        start: ref.watch(startDateProvider),
                        end: DateTime.now(),
                      ),
                      style: inputStyle,
                      format: DateFormat('dd-MMM-yyyy'),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Date Range',
                        iconColor: Colors.red,
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
                    ),
                  );
                },
              ),
              actions: <Widget>[
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState?.saveAndValidate() ?? false) {
                          DateTimeRange dateRange =
                              formKey.currentState!.value['date_range'];

                          ref
                              .watch(startDateProvider.notifier)
                              .update((state) => dateRange.start);

                          ref
                              .watch(endDateProvider.notifier)
                              .update((state) => dateRange.end);
                        }
                      },
                      icon: const Icon(Iconsax.filter),
                      label: const Text("SUBMIT"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                UIHelper.horizontalSpaceMedium(),
              ],
            ),
          ),
        ),
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
                          "CREDIT",
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
                          "DEBIT",
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
        Consumer(
          builder: (context, ref, child) {
            final txns = ref.watch(bankBookProvider);

            return txns.when(
              error: (error, stackTrace) => ErrorWidget(error),
              loading: () => const SliverToBoxAdapter(
                child: LinearProgressIndicator(),
              ),
              data: (data) {
                return SliverList.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: txnItem(context, data[index]),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
