import 'package:findo_isar/presentations/widgets/container_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/variables.dart';
import '../../../theme/ui_helper.dart';
import '../../../utils/utilities.dart';
import 'accounts_controller.dart';

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key, required this.parent, required this.title});

  final int parent;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsProvider(parent));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          parent != 0
              ? IconButton(
                  icon: Icon(
                    Icons.add_box_rounded,
                    size: 28.0.sp,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    switch (parent) {
                      case 2: //--BANK
                        GoRouter.of(context).pushNamed('BANK-ACCOUNT-CREATE');
                        break;

                      case 3: //--Income Account
                        GoRouter.of(context).pushNamed('INCOME-ACCOUNT-CREATE');
                        break;

                      case 4: //--Expenses Account
                        GoRouter.of(context)
                            .pushNamed('EXPENSES-ACCOUNT-CREATE');
                        break;

                      case 5: //--Liabilities
                        GoRouter.of(context)
                            .pushNamed('LIABILITIES-ACCOUNT-CREATE');
                        break;

                      case 6: //--Equities
                        GoRouter.of(context)
                            .pushNamed('EQUITIES-ACCOUNT-CREATE');
                        break;
                    }
                  },
                )
              : const SizedBox.shrink(),
          UIHelper.horizontalSpaceSmall()
        ],
      ),
      body: SafeArea(
        child: accounts.when(
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const LinearProgressIndicator(),
          data: (data) {
            return data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ClipOval(
                          child: Container(
                            alignment: Alignment.center,
                            color: Color(randomColor[randomNumber(
                                min: 0, max: randomColor.length - 1)]),
                            height: 40.0.sp,
                            width: 40.0.sp,
                            child: Text(
                              data[index].name![0],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        title: Text(data[index].name!.toString()),
                        subtitle: Text(
                          data[index].description ?? "No description found..",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: data[index].hasChild == true
                            ? const Icon(Icons.arrow_right_alt)
                            : const SizedBox.shrink(),
                        onTap: () {
                          if (data[index].hasChild == true) {
                            // String accountType = '';

                            // switch (data[index].accountType) {
                            //   case 'CAPITAL': //--BANK

                            //     break;

                            //   case 3: //--Income Account
                            //     accountType = 'INCOME-TYPE';
                            //     break;

                            //   case 4: //--Expenses Account

                            //     break;

                            //   case 5: //--Liabilities

                            //     break;

                            //   case 6: //--Equities

                            //     break;
                            // }

                            GoRouter.of(context)
                                .pushNamed('ACCOUNTS-CHILD', extra: {
                              'account': data[index],
                            });
                          } else {
                            return;
                          }
                        },
                      );
                    },
                  )
                : const BoxedContainer(child: Text("No Data Found"));
          },
        ),
      ),
    );
  }
}
