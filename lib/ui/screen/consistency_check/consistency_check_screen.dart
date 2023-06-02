import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/widgets/button_default.dart';
import 'package:flutter_wallet/util/format_currency.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../util/constant.dart';
import 'consistency_check_controller.dart';

class ConsistencyCheckScreen extends StatelessWidget {
  const ConsistencyCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("CONSISTENCY CHECK"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final accounts = ref.watch(accountsProvider);

                return accounts.when(
                  data: (data) {
                    return FormBuilder(
                      key: formKey,
                      child: Card(
                        elevation: .25,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                  "Consistency check program re calculate the closing balance of account, It also update current balance of after every transaction made."),
                              UIHelper.verticalSpaceMedium(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FormBuilderDropdown<int>(
                                      name: 'hasChild',
                                      style: inputStyle,
                                      isExpanded: false,
                                      itemHeight: null,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: "Select Account",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16)),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      items: data
                                          .map(
                                            (AccountsModel acct) =>
                                                DropdownMenuItem<int>(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              value: acct.id,
                                              child: Text(acct.name.toString(),
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) async {
                                        ref
                                            .watch(selectedAccountProvider
                                                .notifier)
                                            .update((state) => value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
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
            ),
            Consumer(
              builder: (context, ref, child) {
                final accountData = ref.watch(getAccountDataProvider);
                return accountData.when(
                    data: (data) {
                      return data != null
                          ? Card(
                              elevation: .25,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("No of transactions"),
                                        Text(data['txnCount'].toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Opening Balance"),
                                        Text(formatCurrency(
                                                data['openingBalance']
                                                    .toString())
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Current Balance"),
                                        Text(formatCurrency(
                                            data['currentBalance'].toString())),
                                      ],
                                    ),
                                    UIHelper.verticalSpaceExtraLarge(),
                                    ButtonDefault(
                                      text: "CALCULATE",
                                      onTap: () async {
                                        await ref
                                            .watch(calculateProvider.future)
                                            .then((value) {
                                          if (value == true) {
                                            EasyLoading.showToast(
                                                'Successfull');
                                            ref.invalidate(
                                                getAccountDataProvider);
                                          } else {
                                            EasyLoading.showToast('Fail');
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                    error: (error, stackTrace) => ErrorWidget(error),
                    loading: () => const LinearProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
