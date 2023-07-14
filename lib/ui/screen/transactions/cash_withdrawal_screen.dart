import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../../util/ui_helpers.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/button_default.dart';
import '../home/home_controller.dart';
import 'transaction_controller.dart';

class CashWithdrawalScreen extends StatelessWidget {
  const CashWithdrawalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CASH WITHDRAWAL"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: .25,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Select Bank"),
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
                              initialValue: banks[0].id,
                              decoration: const InputDecoration(
                                  labelText: 'Select Bank', isDense: true),
                              items: banks
                                  .map(
                                    (item) => DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: item.id,
                                      child: Text(
                                        item.name!,
                                        style: inputStyle,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      );
                    }),
                    UIHelper.verticalSpaceMedium(),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: 'txnDate',
                            format: DateFormat("dd-MM-yyyy"),
                            style: inputStyle,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialValue: DateTime.now(),
                            firstDate: DateTime(2023, 1, 1),
                            lastDate: DateTime.now(),
                            inputType: InputType.date,
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              isDense: true,
                              suffixIcon: Icon(Iconsax.calendar),
                            ),
                          ),
                        ),
                        UIHelper.horizontalSpaceMedium(),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'amount',
                            textAlign: TextAlign.right,
                            style: inputStyle.copyWith(fontSize: 16),
                            decoration: const InputDecoration(
                                labelText: 'Amount', isDense: true),
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium(),
                    FormBuilderTextField(
                      name: 'description',
                      initialValue: "Cash withdraw from Bank",
                      style: inputStyle,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    UIHelper.verticalSpaceExtraLarge(),
                    Consumer(
                      builder: (context, ref, child) => SizedBox(
                        height: inputHeight,
                        child: ButtonDefault(
                          text: "SUBMIT",
                          onTap: () async {
                            if (formKey.currentState?.saveAndValidate() ??
                                false) {
                              EasyLoading.show(status: 'wait');
                              final data = {
                                'txnDate':
                                    formKey.currentState!.value['txnDate'],
                                'bank': formKey.currentState!.value['bank'],
                                'amount': formKey.currentState!.value['amount'],
                                'description':
                                    formKey.currentState!.value['description']
                              };

                              await ref
                                  .watch(cashWithdrawalProvider(data).future)
                                  .then((value) {
                                //--Reload Home Data
                                ref.invalidate(recentTransactionsProvider);
                                EasyLoading.showSuccess("Done!");
                                GoRouter.of(context).pop();
                              });

                              EasyLoading.dismiss();
                            } else {
                              EasyLoading.dismiss();
                              EasyLoading.showToast("Validation fail");
                            }
                          },
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
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
