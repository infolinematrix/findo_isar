import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/screen/settings/configuration_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/constant.dart';
import '../../widgets/button_default.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CONFIGURATION"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 0)),
                SliverToBoxAdapter(child: Consumer(
                  builder: (context, ref, child) {
                    final settings = ref.watch(configurationProvider);
                    return settings.when(
                      data: (data) {
                        final d = data['defaultLanguage'];

                        return FormBuilder(
                          key: formKey,
                          child: Card(
                            elevation: .25,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Application Settings",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(width: 16),
                                      const Icon(Iconsax.cpu_setting),
                                    ],
                                  ),
                                  Text(
                                    "This app help you to switch to different set of settings for your each of your app individually.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                  ),
                                  UIHelper.verticalSpaceExtraLarge(),
                                  FormBuilderTextField(
                                    name: 'name',
                                    initialValue: data['name'],
                                    style: inputStyle,
                                    decoration: const InputDecoration(
                                        hintText: 'Your Name',
                                        suffixIcon: Icon(Iconsax.user)),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                  ),
                                  UIHelper.verticalSpaceMedium(),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: FormBuilderDropdown(
                                          name: 'currency',
                                          initialValue: data['currency'] ??
                                              currencies[0]['code'],
                                          isExpanded: false,
                                          itemHeight: null,
                                          dropdownColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          decoration: const InputDecoration(
                                            hintText: 'Currency',
                                          ),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                          items: currencies
                                              .map(
                                                (item) => DropdownMenuItem(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  value: item['code'],
                                                  child: Text(
                                                    item['name'],
                                                    style: inputStyle,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      UIHelper.horizontalSpaceMedium(),
                                      Expanded(
                                        flex: 6,
                                        child: FormBuilderDropdown<String>(
                                          name: 'dateFormat',
                                          initialValue: data['dateFormat'] ??
                                              dateFormat[0].toString(),
                                          isExpanded: false,
                                          itemHeight: null,
                                          dropdownColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          decoration: const InputDecoration(
                                              hintText: 'Date Format'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                          items: dateFormat
                                              .map(
                                                (formatedDate) =>
                                                    DropdownMenuItem(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  value: formatedDate,
                                                  child: Text(
                                                    formatedDate,
                                                    style: inputStyle,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  UIHelper.verticalSpaceMedium(),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: FormBuilderDropdown(
                                          name: 'defaultCurrencyFormat',
                                          initialValue:
                                              data['defaultCurrencyFormat'] ??
                                                  currencyFormat[0],
                                          isExpanded: false,
                                          itemHeight: null,
                                          dropdownColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          decoration: const InputDecoration(
                                              hintText: 'Currency Format'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                          items: currencyFormat
                                              .map(
                                                (item) => DropdownMenuItem(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: inputStyle,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      UIHelper.horizontalSpaceMedium(),
                                      Expanded(
                                        flex: 6,
                                        child: FormBuilderDropdown(
                                          name: 'defaultLanguage',
                                          initialValue:
                                              data['defaultLanguage'] ??
                                                  languages[0]['code'],
                                          isExpanded: false,
                                          itemHeight: null,
                                          dropdownColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          decoration: const InputDecoration(
                                              hintText: 'Language'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                          items: languages
                                              .map(
                                                (item) => DropdownMenuItem(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  value: item['code'],
                                                  child: Text(
                                                    item['value'].toString(),
                                                    style: inputStyle,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  UIHelper.verticalSpaceMedium(),
                                  FormBuilderCheckbox(
                                    name: 'isActive',
                                    initialValue: true,
                                    title: InkWell(
                                      onTap: () {},
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Yes, I agree. ',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: 'Terms & Conditions',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                        filled: false,
                                        contentPadding: EdgeInsets.all(0)),
                                    validator: FormBuilderValidators.equal(
                                      true,
                                      errorText:
                                          'You must accept terms and conditions',
                                    ),
                                  ),
                                  UIHelper.verticalSpaceExtraLarge(),
                                  Consumer(
                                    builder: (context, ref, child) {
                                      return ButtonDefault(
                                        text: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .canvasColor),
                                        ),
                                        onTap: () async {
                                          if (formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            await ref
                                                .watch(
                                                    saveConfigurationProvider(
                                                            formKey
                                                                .currentState!
                                                                .value)
                                                        .future)
                                                .then((value) {
                                              if (value == true) {
                                                EasyLoading.showToast(
                                                    'Successufull');
                                              } else {
                                                EasyLoading.showToast('Fail');
                                              }
                                            });
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      error: (error, stackTrace) => ErrorWidget(error),
                      loading: () => const LinearProgressIndicator(),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
