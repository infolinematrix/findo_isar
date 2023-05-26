import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/ui/widgets/button_default.dart';
import 'package:flutter_wallet/util/constant.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/ui_helpers.dart';
import '../accounts_controller.dart';

class CreateBankAccount extends ConsumerWidget {
  const CreateBankAccount({Key? key, required this.account}) : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CREATE BANK ACCOUNT"),
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                          FormBuilderTextField(
                            name: 'bankAccountNo',
                            decoration: const InputDecoration(
                                labelText: 'Account No', isDense: true),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: false),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Row(
                            children: [
                              Expanded(
                                child: FormBuilderTextField(
                                  name: 'openingBalance',
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
                              UIHelper.horizontalSpaceMedium(),
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: 'hasChild',
                                  style: inputStyle,
                                  isExpanded: false,
                                  itemHeight: null,
                                  dropdownColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  decoration: const InputDecoration(
                                      labelText: 'Is Group?', isDense: true),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  items: yesNo
                                      .map((yn) => DropdownMenuItem<bool>(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            value: yn['key'] as bool,
                                            child: Text(yn['value'].toString(),
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          FormBuilderTextField(
                            name: 'description',
                            decoration: const InputDecoration(
                                labelText: 'Description', isDense: true),
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
                            initialValue: true,
                            title: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Yes, Account is active. ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        'Inactive account does not allow transaction',
                                    style: TextStyle(color: Colors.blue),
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
                            text: Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Theme.of(context).canvasColor,
                              ),
                            ),
                            onTap: () async {
                              if (formKey.currentState?.saveAndValidate() ??
                                  false) {
                                EasyLoading.show(status: 'wait');

                                await ref
                                    .watch(
                                        accountsProvider(account.id).notifier)
                                    .create(
                                        parent: account,
                                        formData: formKey.currentState!.value)
                                    .then(
                                  (value) {
                                    EasyLoading.showSuccess("Account created!");
                                    GoRouter.of(context).pop();
                                  },
                                );

                                EasyLoading.dismiss();
                              } else {
                                EasyLoading.dismiss();
                                EasyLoading.showToast("Validation fail");
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
