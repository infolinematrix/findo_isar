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
import '../home/home_controller.dart';
import 'transaction_controller.dart';

class ExpensesEntry extends StatelessWidget {
  const ExpensesEntry({Key? key, required this.account}) : super(key: key);

  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PAYMENT"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Card(
                    elevation: .5,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.only(left: 0),
                            leading: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).splashColor,
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
                              account.description != null
                                  ? account.description!
                                  : 'No description found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Iconsax.wallet,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Budget",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      Text(
                                        account.budget > 0
                                            ? account.budget.toString()
                                            : "Unlimited",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Iconsax.export_1,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    ),
                                  ),
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final status = ref.watch(
                                          accountStatusOftheMonth(account.id));
                                      return status.when(
                                        data: (data) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text("Spending",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            Text(
                                              data['totalDr'].toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ],
                                        ),
                                        error: (error, stackTrace) =>
                                            ErrorWidget(error),
                                        loading: () => const Text("loading.."),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("30% of your income"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FormBuilder(
                    key: formKey,
                    child: Card(
                      elevation: .50,
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
                                  "Payment",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(width: 16),
                                const Text("By Cash/Bank"),
                              ],
                            ),
                            UIHelper.verticalSpaceExtraLarge(),
                            Row(
                              children: [
                                Expanded(
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
                                const SizedBox(width: 16),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return Expanded(
                                      child: FormBuilderDropdown<String>(
                                        name: 'cash_bank',
                                        enabled: true,
                                        initialValue:
                                            ref.watch(txnModeProvider),
                                        decoration: const InputDecoration(
                                          labelText: 'Payment By',
                                          hintText: 'Select',
                                        ),
                                        onChanged: (value) {
                                          ref
                                              .watch(txnModeProvider.notifier)
                                              .update(
                                                  (state) => value.toString());
                                        },
                                        items: ['Cash', 'Bank']
                                            .map(
                                              (pType) => DropdownMenuItem(
                                                value: pType,
                                                child: Text(
                                                  pType,
                                                  // style: inputStyle,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                            Consumer(builder: (context, ref, child) {
                              final banks = ref.watch(bankAccountsProvider);

                              return banks.when(
                                loading: () =>
                                    const CircularProgressIndicator(),
                                error: (error, stackTrace) =>
                                    const Text("Error"),
                                data: (banks) {
                                  return ref.watch(txnModeProvider) == 'Bank'
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
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
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      : const SizedBox.shrink();
                                },
                              );
                            }),
                            UIHelper.verticalSpaceMedium(),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'type',
                                    enabled: false,
                                    initialValue: "EXPENSES",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .primaryColorLight),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
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
                              ],
                            ),
                            UIHelper.verticalSpaceLarge(),
                            FormBuilderTextField(
                              name: 'description',
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            UIHelper.verticalSpaceExtraLarge(),
                            Consumer(
                              builder: (context, ref, child) => SizedBox(
                                height: inputHeight,
                                child: ButtonDefault(
                                  text: Text("PAYMENT",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      )),
                                  onTap: () async {
                                    if (formKey.currentState
                                            ?.saveAndValidate() ??
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
                                          .watch(expenditureEntryProvider(data)
                                              .future)
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
