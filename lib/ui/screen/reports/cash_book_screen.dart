import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../../util/ui_helpers.dart';
import '../../widgets/button_default.dart';
import '../../widgets/txn_item.dart';
import 'reports_controller.dart';

class CashBookScreen extends StatelessWidget {
  const CashBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("CASH BOOK"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormBuilder(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: FormBuilderDateRangePicker(
                                      name: 'date_range',
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2024),
                                      initialValue: DateTimeRange(
                                          start: ref.watch(startDateProvider),
                                          end: ref.watch(endDateProvider)),
                                      style: inputStyle,
                                      format: DateFormat('dd-MM-yyyy'),
                                      decoration: const InputDecoration(
                                        labelText: 'Date Range',
                                        iconColor: Colors.red,
                                        prefixIcon: Icon(Iconsax.calendar),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceSmall(),
                                  Expanded(
                                    flex: 2,
                                    child: ButtonDefault(
                                        text: "GO",
                                        onTap: () async {
                                          if (formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            final DateTimeRange? dtr =
                                                await formKey.currentState!
                                                    .value['date_range'];

                                            ref
                                                .watch(
                                                    startDateProvider.notifier)
                                                .update((state) => dtr!.start);

                                            ref
                                                .watch(endDateProvider.notifier)
                                                .update((state) => dtr!.end.add(
                                                    const Duration(days: 1)));

                                            ref.invalidate(cashBookProvider);

                                            // print(dtr!.start);
                                          } else {
                                            EasyLoading.dismiss();
                                            EasyLoading.showToast(
                                                "Validation fail");
                                          }
                                        }),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Consumer(
                      builder: (context, ref, child) {
                        final txns = ref.watch(cashBookProvider);
                        return Expanded(
                          child: txns.when(
                            loading: () => const CircularProgressIndicator(),
                            error: (error, stackTrace) => const Text("Error"),
                            data: (data) {
                              return ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return txnItem(context, data[index]);
                                },
                              );
                            },
                          ),
                        );
                      },
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
