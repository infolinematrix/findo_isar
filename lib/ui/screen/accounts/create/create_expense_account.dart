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

class CreateExpensesAccount extends StatelessWidget {
  const CreateExpensesAccount({Key? key, required this.account})
      : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CREATE EXPENSES ACCOUNT"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: .25,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FormBuilder(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "EXPENSES ACCOUNT",
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
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          labelText: 'Is Group?',
                                          isDense: true),
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
                                      onChanged: (val) {
                                        ref
                                            .watch(hasChildProvider.notifier)
                                            .update((state) => val!);
                                      },
                                    ),
                                  );
                                },
                              ),
                              UIHelper.horizontalSpaceMedium(),
                              Consumer(
                                builder: (context, ref, child) {
                                  return Expanded(
                                    child: FormBuilderTextField(
                                      name: 'budget',
                                      style: inputStyle,
                                      enabled:
                                          ref.watch(hasChildProvider) == true
                                              ? false
                                              : true,
                                      decoration: const InputDecoration(
                                          labelText: 'Monthly Budget',
                                          isDense: true),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true, decimal: false),
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
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                filled: false),
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
                            validator: FormBuilderValidators.equal(
                              true,
                              errorText: 'You must accept terms and conditions',
                            ),
                          ),
                          UIHelper.verticalSpaceExtraLarge(),
                          Consumer(
                            builder: (context, ref, child) => ButtonDefault(
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
      ),
    );
  }
}
