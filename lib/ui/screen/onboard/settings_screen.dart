import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/constant.dart';
import '../../../util/ui_helpers.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/button_default.dart';
import 'settings_controller.dart';

class BasicSettingsScreen extends StatelessWidget {
  const BasicSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 0)),
                SliverToBoxAdapter(
                  child: FormBuilder(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Application Settings",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                      color:
                                          Theme.of(context).primaryColorDark),
                            ),
                            UIHelper.verticalSpaceExtraLarge(),
                            FormBuilderTextField(
                              name: 'name',
                              style: inputStyle,
                              decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                  isDense: true,
                                  suffixIcon: Icon(Iconsax.user)),
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
                                  flex: 7,
                                  child: FormBuilderDropdown(
                                    name: 'defaultCurrency',
                                    initialValue: currencies[0]['code'],
                                    isExpanded: false,
                                    itemHeight: null,
                                    dropdownColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    decoration: const InputDecoration(
                                        hintText: 'Currency', isDense: true),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required()]),
                                    items: currencies
                                        .map(
                                          (item) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
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
                                    initialValue: dateFormat[0].toString(),
                                    isExpanded: false,
                                    itemHeight: null,
                                    dropdownColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    decoration: const InputDecoration(
                                        hintText: 'Date Format', isDense: true),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required()]),
                                    items: dateFormat
                                        .map(
                                          (formatedDate) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
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
                                    initialValue: currencyFormat[0],
                                    isExpanded: false,
                                    itemHeight: null,
                                    dropdownColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    decoration: const InputDecoration(
                                        hintText: 'Currency Format',
                                        isDense: true),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required()]),
                                    items: currencyFormat
                                        .map(
                                          (item) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
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
                                    initialValue: languages[0]['code'],
                                    isExpanded: false,
                                    itemHeight: null,
                                    dropdownColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    decoration: const InputDecoration(
                                        hintText: 'Language', isDense: true),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required()]),
                                    items: languages
                                        .map(
                                          (item) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
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
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(),
                                    children: const [
                                      TextSpan(
                                        text: 'Yes, I agree. ',
                                      ),
                                      TextSpan(
                                        text: 'Terms & Conditions',
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
                                  text: "SUBMIT",
                                  onTap: () async {
                                    if (formKey.currentState
                                            ?.saveAndValidate() ??
                                        false) {
                                      await ref
                                          .watch(saveConfigurationProvider(
                                                  formKey.currentState!.value)
                                              .future)
                                          .then((value) {
                                        if (value == true) {
                                          // return const HomePage();
                                          GoRouter.of(context)
                                              .pushNamed('HOME');
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
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Effective personal expense tracking and budget management are indispensable for financial success. By regularly monitoring expenses and creating a realistic budget, individuals can take control of their finances, reduce unnecessary spending, and make significant progress towards their financial goals. Embracing technology-driven tools and cultivating disciplined financial habits will pave the way for a more secure and prosperous future.",
                      style: TextStyle(fontWeight: FontWeight.w100),
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
