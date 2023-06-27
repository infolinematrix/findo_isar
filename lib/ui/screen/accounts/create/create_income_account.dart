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

class CreateIncomeAccount extends StatelessWidget {
  const CreateIncomeAccount({Key? key, required this.account})
      : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CREATE INCOME ACCOUNT"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: .25,
            child: FormBuilder(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "INCOME ACCOUNT",
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
                              .copyWith(color: Theme.of(context).disabledColor),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          decoration: const InputDecoration(
                              labelText: 'Account Name', isDense: true),
                          style: inputStyle,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
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
                        Row(
                          children: [
                            Consumer(
                              builder: (context, ref, child) {
                                return Expanded(
                                  child: FormBuilderDropdown<bool>(
                                    name: 'hasChild',
                                    style: inputStyle,
                                    isExpanded: false,
                                    itemHeight: null,
                                    initialValue: false,
                                    dropdownColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
                                              child: Text(
                                                  yn['value'].toString(),
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ))
                                        .toList(),
                                    onChanged: (val) {},
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceLarge(),
                        FormBuilderCheckbox(
                          name: 'isActive',
                          initialValue: true,
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
                          validator: FormBuilderValidators.equal(
                            true,
                            errorText: 'You must accept terms and conditions',
                          ),
                          decoration: const InputDecoration(
                              filled: false, contentPadding: EdgeInsets.all(0)),
                        ),
                        UIHelper.verticalSpaceExtraLarge(),
                        Consumer(
                          builder: (context, ref, child) => ButtonDefault(
                            text: "SUBMIT",
                            onTap: () async {
                              if (formKey.currentState?.saveAndValidate() ??
                                  false) {
                                EasyLoading.show(status: 'wait');

                                await ref
                                    .watch(childAccountsProvider(account.id)
                                        .notifier)
                                    .create(
                                        parent: account,
                                        formData: formKey.currentState!.value)
                                    .then((value) {
                                  EasyLoading.showSuccess("Account created!");
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
    );
  }
}
