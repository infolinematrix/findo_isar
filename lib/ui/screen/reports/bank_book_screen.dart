import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/txn_item.dart';

class BankBookScreen extends StatelessWidget {
  const BankBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("ICICI BANK LIMITED"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: '12-05-2023 - 13-05/2023',
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () => GoRouter.of(context).pop(),
                                child: const Icon(Iconsax.calendar, size: 32),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: ListView.separated(
                          itemCount: 10,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return txnItem(context);
                          },
                        ),
                      ),
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
