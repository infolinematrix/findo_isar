import 'package:findo_isar/app/constants/variables.dart';
import 'package:findo_isar/app/functions/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../data/models/accounts_model.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/ui_helper.dart';
import '../../widgets/index.dart';
import '../home/home_controller.dart';
import 'transaction_controller.dart';

class TxnPaymentScreen extends StatelessWidget {
  const TxnPaymentScreen({super.key, required this.account});

  final AccountsModel account;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("PAYMENT ENTRY"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                BoxedContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UIHelper.verticalSpaceLarge(),
                      SizedBox(
                        height: inputHeight,
                        child: FormBuilderTextField(
                          name: 'account',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          initialValue: account.name,
                          readOnly: true,
                          enabled: false,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: const InputDecoration(
                            labelText: 'Account',
                            suffixIcon: Icon(Iconsax.search_normal),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      SizedBox(
                        height: inputHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: FormBuilderDateTimePicker(
                                name: 'txnDate',
                                style: inputStyle,
                                format:
                                    DateFormat(getSetting(key: 'dateFormat')),
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                initialValue: DateTime.now(),
                                firstDate: DateTime(2023, 1, 1),
                                lastDate: DateTime.now(),
                                inputType: InputType.date,
                                decoration: const InputDecoration(
                                  labelText: 'Date',
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                              ),
                            ),
                            UIHelper.horizontalSpaceMedium(),
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'txn',
                                style: inputStyle,
                                initialValue: account.accountType,
                                enabled: false,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: const InputDecoration(
                                    labelText: 'Transaction'),
                                textInputAction: TextInputAction.next,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                                ],
                                // onChanged: (value) =>
                                //     double.parse(value.toString())
                                //         .toDouble(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceLarge(),
                      Row(
                        children: [
                          Consumer(
                            builder: (context, ref, child) => Expanded(
                              child: SizedBox(
                                height: inputHeight,
                                child: FormBuilderDropdown<String>(
                                  name: 'cash_bank',
                                  initialValue: ref.watch(txnModeProvider),
                                  decoration: const InputDecoration(
                                    labelText: 'Payment By',
                                    hintText: 'Select',
                                  ),
                                  onChanged: (value) {
                                    ref
                                        .watch(txnModeProvider.notifier)
                                        .update((state) => value.toString());
                                  },
                                  items: ['Cash', 'Bank']
                                      .map((pType) => DropdownMenuItem(
                                            value: pType,
                                            child: Text(pType),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          UIHelper.horizontalSpaceMedium(),
                          Expanded(
                            child: SizedBox(
                              height: inputHeight,
                              child: FormBuilderTextField(
                                name: 'amount',
                                style: inputStyle,
                                initialValue: "125.25",
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration:
                                    const InputDecoration(labelText: 'Amount'),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Consumer(builder: (context, ref, child) {
                        final banks = ref.watch(bankAccountsProvider);

                        return banks.when(
                          loading: () => const CircularProgressIndicator(),
                          error: (error, stackTrace) => const Text("Error"),
                          data: (banks) {
                            return ref.watch(txnModeProvider) == 'Bank'
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      UIHelper.verticalSpaceMedium(),
                                      SizedBox(
                                        height: inputHeight,
                                        child: FormBuilderDropdown<int>(
                                          name: 'bank',
                                          initialValue: banks[0].id,
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
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink();
                          },
                        );
                      }),
                      UIHelper.verticalSpaceMedium(),
                      SizedBox(
                        height: inputHeight,
                        child: FormBuilderTextField(
                          name: 'description',
                          style: inputStyle,
                          initialValue: "This is description",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Consumer(
                        builder: (context, ref, child) => Align(
                          alignment: Alignment.centerRight,
                          child: ButtonDefault(
                            text: const Text("SUBMIT"),
                            onTap: () async {
                              if (formKey.currentState?.saveAndValidate() ??
                                  false) {
                                EasyLoading.show(status: 'wait');

                                final data = {
                                  'data': formKey.currentState!.value,
                                  'account': {
                                    'accountNo': account.id,
                                    'accountName': account.name,
                                    'accountType': account.accountType
                                  },
                                  'txnMode': ref.read(txnModeProvider)
                                };

                                await ref
                                    .watch(
                                        paymentTransactionProvider(data).future)
                                    .then((value) {
                                  //--Reload Home Data
                                  ref.invalidate(recentTxnProvider);
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
