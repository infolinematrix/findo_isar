import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/accounts_model.dart';
import '../../../util/dialog.dart';
import '../../widgets/annotated_region.dart';
import 'accounts_controller.dart';

class AccountsChildScreen extends StatelessWidget {
  const AccountsChildScreen({Key? key, required this.account})
      : super(key: key);
  final AccountsModel account;

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: Text(account.name.toString().trim().toUpperCase()),
          actions: [
            account.hasChild == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextButton.icon(
                      onPressed: () {
                        switch (account.accountType) {
                          case 'BANK':
                            GoRouter.of(context).pushNamed(
                                "CREATE-BANK-ACCOUNT",
                                extra: {'account': account});
                            break;

                          case 'EXPENDITURE':
                            GoRouter.of(context).pushNamed(
                                "CREATE-EXPENSES-ACCOUNT",
                                extra: {'account': account});
                            break;

                          case 'INCOME':
                            GoRouter.of(context).pushNamed(
                                "CREATE-INCOME-ACCOUNT",
                                extra: {'account': account});
                            break;
                          case 'LIABILITIES':
                            GoRouter.of(context).pushNamed(
                                "CREATE-LIABILITY-ACCOUNT",
                                extra: {'account': account});
                            break;
                        }
                      },
                      icon: const Icon(Iconsax.add_square),
                      label: const Text("ADD NEW"),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  stretch: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Search..',
                            border: InputBorder.none,
                            suffixIcon: Icon(Iconsax.search_normal, size: 24),
                          ),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                Consumer(
                  builder: (context, ref, child) {
                    final accounts = ref.watch(accountsProvider(account.id));

                    return accounts.when(
                      error: (error, stackTrace) =>
                          SliverToBoxAdapter(child: ErrorWidget(error)),
                      loading: () => const SliverToBoxAdapter(
                          child: LinearProgressIndicator()),
                      data: (data) {
                        return SliverFixedExtentList(
                          itemExtent: 78, // I'm forcing item heights
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  extentRatio: .45,
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      icon: Iconsax.close_square,
                                      padding: const EdgeInsets.all(8),
                                      label: 'Delete',
                                      borderRadius: BorderRadius.circular(10),
                                      onPressed: (context) async {
                                        AlertAction? action = await confirmDialog(
                                            context,
                                            "WARNING\nYou want delete transaction. \nYou will loose all the transaction happend on this account.");

                                        if (action == AlertAction.ok) {
                                          await ref
                                              .watch(
                                                  accountsProvider(account.id)
                                                      .notifier)
                                              .delete(id: data[index].id);
                                        }
                                      },
                                    ),
                                    SlidableAction(
                                      icon: Iconsax.document_upload,
                                      padding: const EdgeInsets.all(8),
                                      borderRadius: BorderRadius.circular(10),
                                      label: 'Update',
                                      onPressed: (context) {
                                        switch (data[index].accountType) {
                                          case 'BANK':
                                            GoRouter.of(context).pushNamed(
                                                "UPDATE-BANK-ACCOUNT",
                                                extra: {
                                                  'account': data[index]
                                                });
                                            break;

                                          case 'EXPENDITURE':
                                            GoRouter.of(context).pushNamed(
                                                "UPDATE-EXPENSES-ACCOUNT",
                                                extra: {
                                                  'account': data[index]
                                                });
                                            break;

                                          case 'INCOME':
                                            GoRouter.of(context).pushNamed(
                                                "UPDATE-INCOME-ACCOUNT",
                                                extra: {
                                                  'account': data[index]
                                                });
                                            break;
                                          case 'LIABILITIES':
                                            GoRouter.of(context).pushNamed(
                                                "UPDATE-LIABILITY-ACCOUNT",
                                                extra: {
                                                  'account': data[index]
                                                });
                                            break;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                child: Card(
                                  elevation: .25,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    leading: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          data[index].name![0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      data[index].name!.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    subtitle: Text(
                                      data[index].description ??
                                          "No description found..",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    trailing: data[index].hasChild == true
                                        ? const Icon(Iconsax.arrow_21)
                                        : const SizedBox.shrink(),
                                    onTap: () {
                                      if (data[index].hasChild == true) {
                                        GoRouter.of(context).pushNamed(
                                            'ACCOUNTS-CHILD',
                                            extra: {
                                              'account': data[index],
                                            });
                                      } else {
                                        // GoRouter.of(context).pushNamed(
                                        //     'ACCOUNT-STATEMENT',
                                        //     extra: {
                                        //       'account': data[index],
                                        //     });
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                            childCount: data.length,
                          ),
                        );
                      },
                    );
                  },
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
