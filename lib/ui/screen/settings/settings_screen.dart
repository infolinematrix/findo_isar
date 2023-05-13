import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/constant.dart';
import '../../widgets/button_default.dart';
import '../../widgets/input_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SETTINGS"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: FormBuilder(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Application Settings",
                                style: Theme.of(context).textTheme.titleMedium,
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
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: inputHeight,
                            child: Container(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).canvasColor,
                              ),
                              child: InputContainer(
                                child: FormBuilderTextField(
                                  name: 'name',
                                  style: inputStyle,
                                  decoration: const InputDecoration(
                                    labelText: 'Your Name',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: FormBuilderDropdown(
                                      name: 'currency',
                                      initialValue: dateFormat[0],
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          labelText: 'Currency'),
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
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: FormBuilderDropdown<String>(
                                      name: 'dateFormat',
                                      initialValue: dateFormat[0],
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          labelText: 'Date Format'),
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: FormBuilderDropdown(
                                      name: 'currencyFormat',
                                      initialValue: dateFormat[0],
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          labelText: 'Currency Format'),
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
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: FormBuilderDropdown<String>(
                                      name: 'theme',
                                      initialValue: dateFormat[0],
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          labelText: 'Theme'),
                                      validator: FormBuilderValidators.compose(
                                          [FormBuilderValidators.required()]),
                                      items: themes
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: inputHeight,
                            child: ButtonDefault(
                              text: const Text("SUBMIT"),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
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
