import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/constants/variables.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/ui_helper.dart';
import '../../../widgets/index.dart';
import '../accounts_controller.dart';

class IncomeAccountUpdateScreen extends ConsumerWidget {
  const IncomeAccountUpdateScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final account = ref.watch(getAccountProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text("UPDATE ACCOUNT"),
      ),
      body: account.when(
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          return SingleChildScrollView(
            child: FormBuilder(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoxedContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "INCOME",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Application settings enables you to save state in the application using very little information.",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          UIHelper.verticalSpaceLarge(),
                          SizedBox(
                            height: inputHeight,
                            child: FormBuilderTextField(
                              name: 'name',
                              initialValue: data.name.toString().trim(),
                              style: inputStyle,
                              decoration: const InputDecoration(
                                  labelText: 'Title/Group'),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'type',
                                    enabled: false,
                                    initialValue: "INCOME",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                    decoration: const InputDecoration(
                                        labelText: 'Type'),
                                  ),
                                ),
                                UIHelper.horizontalSpaceMedium(),
                                Consumer(
                                  builder: (context, ref, child) => Expanded(
                                    child: FormBuilderDropdown(
                                      name: 'hasChild',
                                      style: inputStyle,
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                        labelText: 'Has Child',
                                      ),
                                      initialValue: data.hasChild,
                                      enabled: false,
                                      items: yesNo
                                          .map(
                                            (yn) => DropdownMenuItem<bool>(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              value: yn['key'] as bool,
                                              child: Text(
                                                  yn['value'].toString(),
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Consumer(
                          //   builder: (context, ref, child) => ref
                          //               .watch(hasChildProvider) ==
                          //           false
                          //       ? Column(
                          //           children: [
                          //             UIHelper.verticalSpaceMedium(),
                          //             SizedBox(
                          //               height: inputHeight,
                          //               child: Row(
                          //                 children: [
                          //                   Expanded(
                          //                     child: FormBuilderTextField(
                          //                       name: 'openingBalance',
                          //                       style: const TextStyle(
                          //                           fontWeight: FontWeight.w500),
                          //                       decoration: const InputDecoration(
                          //                           labelText: 'Opening Balance'),
                          //                       keyboardType: const TextInputType
                          //                               .numberWithOptions(
                          //                           signed: true, decimal: true),
                          //                     ),
                          //                   ),
                          //                   UIHelper.horizontalSpaceMedium(),
                          //                   Expanded(
                          //                     child: FormBuilderTextField(
                          //                       name: 'budget',
                          //                       style: const TextStyle(
                          //                           fontWeight: FontWeight.w500),
                          //                       decoration: const InputDecoration(
                          //                           labelText: 'Budget (Monthly)'),
                          //                       keyboardType: const TextInputType
                          //                               .numberWithOptions(
                          //                           signed: true, decimal: true),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       : const SizedBox.shrink(),
                          // ),
                          UIHelper.verticalSpaceLarge(),
                          SizedBox(
                            height: inputHeight,
                            child: FormBuilderCheckbox(
                              name: 'isActive',
                              initialValue: true,
                              decoration: checkBoxDecoration,
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
                                errorText:
                                    'You must accept terms and conditions',
                              ),
                            ),
                          ),

                          UIHelper.verticalSpaceMedium(),
                          SizedBox(
                            height: inputHeight,
                            child: FormBuilderTextField(
                              name: 'description',
                              initialValue: data.description != null
                                  ? data.description.toString().trim()
                                  : "",
                              style: inputStyle,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: const InputDecoration(
                                  labelText: 'Description'),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),

                          Text(
                            "SETTINGS",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Text(
                            "Application settings enables you to save state in the application using very little information.",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          UIHelper.verticalSpaceLarge(),

                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       SizedBox(
                          //         child: FormBuilderSwitch(
                          //           title: const Text('Allow Payment'),
                          //           name: 'allowPayment',
                          //           initialValue: data.hd,
                          //           decoration: checkBoxDecoration,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         child: FormBuilderSwitch(
                          //           title: const Text('Allow Receipt'),
                          //           name: 'allowReceipt',
                          //           initialValue: data.hc,
                          //           decoration: checkBoxDecoration,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         child: FormBuilderSwitch(
                          //           title: const Text('Allow Transfer Credit'),
                          //           name: 'allowTransfer',
                          //           initialValue: data.tc,
                          //           decoration: checkBoxDecoration,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         child: FormBuilderSwitch(
                          //           title: const Text('Allow Transfer Debit'),
                          //           name: 'allowTransfer',
                          //           initialValue: data.td,
                          //           decoration: checkBoxDecoration,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
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

                              await ref
                                  .watch(accountsProvider(data.parent).notifier)
                                  .update(
                                      id: id,
                                      accountType: 'INCOME-TYPE',
                                      formData: formKey.currentState!.value)
                                  .then((value) {
                                EasyLoading.showSuccess("Account Updated!");
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
            ),
          );
        },
      ),
    );
  }
}
