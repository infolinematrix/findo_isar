import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/accounts_model.dart';
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
                      onPressed: () {},
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
                  flexibleSpace: Container(
                    padding: const EdgeInsets.only(
                        left: 0, right: 18, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search..',
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Iconsax.search_normal, size: 24),
                          ),
                        )
                      ],
                    ),
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
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor,
                                ),
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
                                        .headlineMedium,
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
                                      GoRouter.of(context)
                                          .pushNamed('ACCOUNTS-CHILD', extra: {
                                        'account': data[index],
                                      });
                                    } else {
                                      GoRouter.of(context)
                                          .pushNamed('ACCOUNT-STATEMENT');
                                    }
                                  },
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
