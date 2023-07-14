import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/accounts_model.dart';
import '../../../../util/constant.dart';
import '../../../../util/ui_helpers.dart';
import '../../../widgets/annotated_region.dart';
import '../../../widgets/button_default.dart';
import '../accounts_controller.dart';

class UpdateBankAccount extends ConsumerWidget {
  const UpdateBankAccount({Key? key, required this.account}) : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UPDATE BANK ACCOUNT"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Card(
              elevation: .25,
              child: FormBuilder(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "ACCOUNT",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Add your Bank accounts with available balance, it will  help you to calculate & show the current balance.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).disabledColor),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceLarge(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            initialValue: account.name,
                            decoration: const InputDecoration(
                                labelText: 'Bank Name', isDense: true),
                            style: inputStyle,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Row(
                            children: [
                              Expanded(
                                child: FormBuilderTextField(
                                  name: 'bankAccountNo',
                                  initialValue:
                                      account.bankAccountNo.toString(),
                                  style: inputStyle,
                                  decoration: const InputDecoration(
                                      labelText: 'Account No', isDense: true),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: false),
                                ),
                              ),
                              UIHelper.horizontalSpaceMedium(),
                              Expanded(
                                child: FormBuilderTextField(
                                  name: 'openingBalance',
                                  initialValue:
                                      account.openingBalance.toString(),
                                  style: inputStyle,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  decoration: const InputDecoration(
                                      labelText: 'Opening Balance',
                                      isDense: true),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                ),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          FormBuilderTextField(
                            name: 'description',
                            style: inputStyle,
                            initialValue: account.description ?? '',
                            decoration: const InputDecoration(
                                hintText: 'Description', isDense: true),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          UIHelper.verticalSpaceMedium(),
                          FormBuilderCheckbox(
                            name: 'isActive',
                            initialValue: account.status == 51 ? true : false,
                            title: RichText(
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(),
                                children: const [
                                  TextSpan(
                                    text: 'Yes, Account is active. ',
                                  ),
                                  TextSpan(
                                    text:
                                        'Inactive account does not allow transaction',
                                  ),
                                ],
                              ),
                            ),
                            decoration: const InputDecoration(
                                filled: false,
                                contentPadding: EdgeInsets.all(0)),
                            validator: FormBuilderValidators.equal(
                              true,
                              errorText: 'You must accept terms and conditions',
                            ),
                          ),
                          UIHelper.verticalSpaceLarge(),
                          ButtonDefault(
                            text: "SUBMIT",
                            onTap: () async {
                              if (formKey.currentState?.saveAndValidate() ??
                                  false) {
                                if (double.parse(formKey.currentState!
                                            .value['openingBalance']
                                            .toString())
                                        .toDouble() >
                                    0) {
                                  EasyLoading.showToast(
                                      "Opening balance must be nagative");
                                  return;
                                }
                                EasyLoading.show(status: 'wait');

                                await ref
                                    .watch(
                                        accountsProvider(account.id).notifier)
                                    .update(
                                  formData: {
                                    'account': account,
                                    'data': formKey.currentState!.value
                                  },
                                ).then((value) {
                                  ref.invalidate(
                                      accountsProvider(account.parent));
                                  EasyLoading.showSuccess("Account Updated!");
                                  GoRouter.of(context).pop();
                                });

                                EasyLoading.dismiss();
                              } else {
                                EasyLoading.dismiss();
                                EasyLoading.showToast("Error Updating");
                              }
                            },
                          ),
                          UIHelper.verticalSpaceLarge(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
