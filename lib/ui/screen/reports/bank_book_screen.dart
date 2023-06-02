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
import '../../widgets/input_container.dart';
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
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 18, right: 18, top: 4, bottom: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Consumer(builder: (context, ref, child) {
                              final banks = ref.watch(bankAccountsProvider);

                              return banks.when(
                                loading: () =>
                                    const CircularProgressIndicator(),
                                error: (error, stackTrace) =>
                                    const Text("Error"),
                                data: (banks) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: InputContainer(
                                      child: SizedBox(
                                        height: inputHeight,
                                        child: FormBuilderDropdown<int>(
                                          name: 'bank',
                                          decoration: const InputDecoration(
                                            labelText: 'Select Bank',
                                          ),
                                          items: banks
                                              .map(
                                                (item) => DropdownMenuItem(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  value: item.id,
                                                  child: Text(
                                                    item.name!,
                                                    style: inputStyle,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                            UIHelper.verticalSpaceSmall(),
                            Consumer(
                              builder: (context, ref, child) {
                                return SizedBox(
                                  height: inputHeight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: InputContainer(
                                          child: FormBuilderDateRangePicker(
                                            name: 'date_range',
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime(2024),
                                            initialValue: DateTimeRange(
                                                start: ref
                                                    .watch(startDateProvider),
                                                end:
                                                    ref.watch(endDateProvider)),
                                            style: inputStyle,
                                            format: DateFormat('dd-MM-yyyy'),
                                            decoration: const InputDecoration(
                                              labelText: 'Date Range',
                                              iconColor: Colors.red,
                                              suffixIcon:
                                                  Icon(Iconsax.calendar),
                                            ),
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
                                                    .watch(startDateProvider
                                                        .notifier)
                                                    .update(
                                                        (state) => dtr!.start);

                                                ref
                                                    .watch(endDateProvider
                                                        .notifier)
                                                    .update((state) => dtr!.end
                                                        .add(const Duration(
                                                            days: 1)));

                                                ref
                                                    .watch(selectedAccount
                                                        .notifier)
                                                    .update((state) => formKey
                                                        .currentState!
                                                        .value['bank']);

                                                ref.invalidate(
                                                    bankBookProvider);
                                              } else {
                                                EasyLoading.dismiss();
                                                EasyLoading.showToast(
                                                    "Validation fail");
                                              }
                                            }),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Consumer(
                      builder: (context, ref, child) {
                        final txns = ref.watch(bankBookProvider);
                        return Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16, bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: txns.when(
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) => const Text("Error"),
                              data: (data) {
                                return ListView.separated(
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // return null;

                                    return txnItem(context, data[index]);
                                  },
                                );
                              },
                            ),
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
