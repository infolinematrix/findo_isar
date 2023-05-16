import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/button_default.dart';
import '../../widgets/input_container.dart';
import '../home/home_controller.dart';
import 'transaction_controller.dart';

class IncomeEntry extends StatelessWidget {
  const IncomeEntry({Key? key, required this.account}) : super(key: key);

  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("RECEIVE"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, top: 16, bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 0),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Center(
                              child: Text(
                                account.name![0].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          title: Text(
                            account.name!,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            account.description!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
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
                                "Receive",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 16),
                              const Text("To Cash/Bank"),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: FormBuilderDateTimePicker(
                                      name: 'txnDate',
                                      format: DateFormat("dd-MM-yyyy"),
                                      style: inputStyle,
                                      initialEntryMode:
                                          DatePickerEntryMode.calendarOnly,
                                      initialValue: DateTime.now(),
                                      firstDate: DateTime(2023, 1, 1),
                                      lastDate: DateTime.now(),
                                      inputType: InputType.date,
                                      decoration: const InputDecoration(
                                        labelText: 'Date',
                                        suffixIcon: Icon(Iconsax.calendar),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return Expanded(
                                      child: SizedBox(
                                        height: inputHeight,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                Theme.of(context).canvasColor,
                                          ),
                                          child: FormBuilderDropdown<String>(
                                            name: 'cash_bank',
                                            initialValue:
                                                ref.watch(txnModeProvider),
                                            decoration: const InputDecoration(
                                              labelText: 'Payment By',
                                              hintText: 'Select',
                                            ),
                                            onChanged: (value) {
                                              ref
                                                  .watch(
                                                      txnModeProvider.notifier)
                                                  .update((state) =>
                                                      value.toString());
                                            },
                                            items: ['Cash', 'Bank']
                                                .map(
                                                  (pType) => DropdownMenuItem(
                                                    value: pType,
                                                    child: Text(
                                                      pType,
                                                      style: inputStyle,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Consumer(builder: (context, ref, child) {
                            final banks = ref.watch(bankAccountsProvider);

                            return banks.when(
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) => const Text("Error"),
                              data: (banks) {
                                return ref.watch(txnModeProvider) == 'Bank'
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: InputContainer(
                                          child: SizedBox(
                                            height: inputHeight,
                                            child: FormBuilderDropdown<int>(
                                              name: 'bank',
                                              initialValue: banks[0].id,
                                              decoration: const InputDecoration(
                                                labelText: 'Select Bank',
                                              ),
                                              items: banks
                                                  .map(
                                                    (item) => DropdownMenuItem(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      value: item.id,
                                                      child: Text(
                                                        item.name!,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink();
                              },
                            );
                          }),
                          UIHelper.verticalSpaceMedium(),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InputContainer(
                                    child: FormBuilderTextField(
                                      name: 'type',
                                      enabled: false,
                                      initialValue: "INCOME",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorLight),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: InputContainer(
                                    child: FormBuilderTextField(
                                      name: 'amount',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Amount',
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true, decimal: true),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          SizedBox(
                            height: inputHeight,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).canvasColor,
                              ),
                              child: FormBuilderTextField(
                                name: 'description',
                                decoration: const InputDecoration(
                                  labelText: 'Description',
                                ),
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceLarge(),
                          Consumer(
                            builder: (context, ref, child) => SizedBox(
                              height: inputHeight,
                              child: ButtonDefault(
                                text: const Text("SUBMIT"),
                                onTap: () async {
                                  if (formKey.currentState?.saveAndValidate() ??
                                      false) {
                                    EasyLoading.show(status: 'wait');

                                    final data = {
                                      'data': formKey.currentState!.value,
                                      'account': {
                                        'accountNo': account.id,
                                        'accountName': account.name,
                                        'accountType': account.accountType
                                      },
                                      'txnMode': ref.read(txnModeProvider)
                                    };

                                    await ref
                                        .watch(incomeEntryProvider(data).future)
                                        .then((value) {
                                      //--Reload Home Data
                                      ref.invalidate(
                                          recentTransactionsProvider);
                                      EasyLoading.showSuccess("Done!");
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
                          ),
                          UIHelper.verticalSpaceMedium(),
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
