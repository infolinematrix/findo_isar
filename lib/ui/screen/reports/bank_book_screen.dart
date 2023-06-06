import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/ui/widgets/button_default.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../widgets/txn_item.dart';
import 'reports_controller.dart';

class BankBookScreen extends StatelessWidget {
  const BankBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("BANK BOOK"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormBuilder(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Consumer(builder: (context, ref, child) {
                            final banks = ref.watch(bankAccountsProvider);

                            return banks.when(
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) => const Text("Error"),
                              data: (banks) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: FormBuilderDropdown<int>(
                                    name: 'bank',
                                    decoration: const InputDecoration(
                                        labelText: 'Select Bank',
                                        isDense: true),
                                    items: banks
                                        .map(
                                          (item) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            value: item.id,
                                            child: Text(
                                              item.name!,
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
                                );
                              },
                            );
                          }),
                          UIHelper.verticalSpaceMedium(),
                          Consumer(
                            builder: (context, ref, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: FormBuilderDateRangePicker(
                                      name: 'date_range',
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2024),
                                      initialValue: DateTimeRange(
                                          start: ref.watch(startDateProvider),
                                          end: ref.watch(endDateProvider)),
                                      style: inputStyle,
                                      format: DateFormat('dd-MM-yyyy'),
                                      decoration: const InputDecoration(
                                        hintText: 'Date Range',
                                        isDense: true,
                                        suffixIcon: Icon(Iconsax.calendar),
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceSmall(),
                                  Expanded(
                                    flex: 2,
                                    child: ButtonDefault(
                                        text: "GO",
                                        onTap: () async {
                                          if (formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            final DateTimeRange? dtr =
                                                await formKey.currentState!
                                                    .value['date_range'];

                                            ref
                                                .watch(
                                                    startDateProvider.notifier)
                                                .update((state) => dtr!.start);

                                            ref
                                                .watch(endDateProvider.notifier)
                                                .update((state) => dtr!.end.add(
                                                    const Duration(days: 1)));

                                            ref.invalidate(bankBookProvider);
                                          } else {
                                            EasyLoading.dismiss();
                                            EasyLoading.showToast(
                                                "Validation fail");
                                          }
                                        }),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Consumer(
                      builder: (context, ref, child) {
                        final txns = ref.watch(bankBookProvider);
                        return Expanded(
                          child: txns.when(
                            loading: () => const LinearProgressIndicator(),
                            error: (error, stackTrace) => const Text("Error"),
                            data: (data) {
                              return ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return txnItem(context, data[index]);
                                },
                              );
                            },
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
      ),
    );
  }
}
