import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/screen/transactions/transaction_controller.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';

import '../../../util/constant.dart';

class CashWithdrawalScreen extends StatelessWidget {
  const CashWithdrawalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CASH WITHDRAWAL"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: FormBuilder(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Select Bank"),
                  UIHelper.verticalSpaceMedium(),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        height: inputHeight,
                        child: Container(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).canvasColor,
                          ),
                          child: FormBuilderDropdown<String>(
                            name: 'cash_bank',
                            initialValue: ref.watch(txnModeProvider),
                            decoration: const InputDecoration(
                              labelText: 'Payment By',
                              hintText: 'Select',
                            ),
                            onChanged: (value) {
                              ref
                                  .watch(txnModeProvider.notifier)
                                  .update((state) => value.toString());
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
                      );
                    },
                  ),
                  // UIHelper.verticalSpaceMedium(),
                  // Consumer(
                  //   builder: (context, ref, child) {
                  //     return Expanded(
                  //       child: SizedBox(
                  //         height: inputHeight,
                  //         child: Container(
                  //           padding: const EdgeInsets.only(left: 16, right: 0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(5),
                  //             color: Theme.of(context).canvasColor,
                  //           ),
                  //           child: FormBuilderDropdown<String>(
                  //             name: 'cash_bank',
                  //             initialValue: ref.watch(txnModeProvider),
                  //             decoration: const InputDecoration(
                  //               labelText: 'Payment By',
                  //               hintText: 'Select',
                  //             ),
                  //             onChanged: (value) {
                  //               ref
                  //                   .watch(txnModeProvider.notifier)
                  //                   .update((state) => value.toString());
                  //             },
                  //             items: ['Cash', 'Bank']
                  //                 .map(
                  //                   (pType) => DropdownMenuItem(
                  //                     value: pType,
                  //                     child: Text(
                  //                       pType,
                  //                       style: inputStyle,
                  //                     ),
                  //                   ),
                  //                 )
                  //                 .toList(),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
