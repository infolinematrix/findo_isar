import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/button_default.dart';
import '../../widgets/input_container.dart';

class IncomeEntry extends StatelessWidget {
  const IncomeEntry({Key? key}) : super(key: key);

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
                                "A",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          title: Text(
                            "Vegitable Expenses",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: const Text(
                            "A simple way to remove the back button in the AppBar is to set",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Budget",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    Text(
                                      "12,645.52",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Spending",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    Text(
                                      "12,645.52",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                                "Receive",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 16),
                              const Text("By Cash/Bank"),
                            ],
                          ),
                          const SizedBox(height: 16),
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
                                Expanded(
                                  child: SizedBox(
                                    height: inputHeight,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      child: FormBuilderDropdown<String>(
                                        name: 'cash_bank',
                                        decoration: const InputDecoration(
                                          labelText: 'Payment By',
                                          hintText: 'Select',
                                        ),
                                        onChanged: (value) {},
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
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: SizedBox(
                              height: inputHeight,
                              child: InputContainer(
                                child: FormBuilderDropdown<String>(
                                  name: 'cash_bank',
                                  decoration: const InputDecoration(
                                    labelText: 'Select Bank',
                                  ),
                                  onChanged: (value) {},
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
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: inputHeight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InputContainer(
                                    child: FormBuilderTextField(
                                      name: 'type',
                                      enabled: false,
                                      initialValue: "EXPENSES",
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
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
                                onChanged: (value) {},
                              ),
                            ),
                          ),
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
