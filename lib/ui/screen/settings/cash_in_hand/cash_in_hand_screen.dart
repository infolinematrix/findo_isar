import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../util/constant.dart';
import '../../../widgets/button_default.dart';
import 'cash_in_hand_controller.dart';

class CashInHandScreen extends ConsumerWidget {
  const CashInHandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final cashAccount = ref.watch(cashAccountProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CASH IN HAND",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                cashAccount.when(
                  data: (data) {
                    return FormBuilder(
                      key: formKey,
                      child: Card(
                        elevation: .25,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // const Text("Update Opening balance of Cash in hand"),
                              const Text(
                                  "Please add (-) sign before the amount, becouse cash balance allways Debit balance."),
                              UIHelper.verticalSpaceMedium(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: FormBuilderTextField(
                                      name: 'opening_balance',
                                      initialValue:
                                          data.openingBalance.toString(),
                                      decoration: const InputDecoration(
                                          labelText: 'Opening Balance',
                                          isDense: true),
                                      style: inputStyle,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true, decimal: true),
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceLarge(),
                                  Expanded(
                                    flex: 4,
                                    child: ButtonDefault(
                                      text: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).canvasColor),
                                      ),
                                      onTap: () async {
                                        if (formKey.currentState
                                                ?.saveAndValidate() ??
                                            false) {
                                          final double oBal = double.parse(
                                                  formKey.currentState!
                                                      .value['opening_balance'])
                                              .toDouble();

                                          if (oBal > 0) {
                                            EasyLoading.showToast(
                                                "Invalid Cash Balance");
                                            return;
                                          } else {
                                            await ref
                                                .watch(
                                                    updateOpeningBalanceProvider(
                                                            {'balance': oBal})
                                                        .future)
                                                .then((value) {
                                              if (value == true) {
                                                EasyLoading.showToast(
                                                    "Successful..");
                                              } else {
                                                EasyLoading.showToast("Done");
                                              }
                                            });
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpaceMedium(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) => ErrorWidget(error),
                  loading: () => const LinearProgressIndicator(),
                ),
                UIHelper.verticalSpaceExtraLarge(),
                Card(
                  elevation: .25,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                            "Consistency check program, It will update closing balance. It may use large memory & can take longer time."),
                        UIHelper.verticalSpaceMedium(),
                        ButtonDefault(
                          text: Text("Run Consistency",
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor)),
                          onTap: null,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
