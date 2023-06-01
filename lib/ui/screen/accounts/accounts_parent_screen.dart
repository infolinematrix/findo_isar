import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'accounts_controller.dart';

class AccountsParentScreen extends ConsumerWidget {
  const AccountsParentScreen(
      {Key? key, required this.parent, required this.title})
      : super(key: key);
  final int parent;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsProvider(parent));
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title.toString().trim()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: accounts.when(
              error: (error, stackTrace) => ErrorWidget(error),
              loading: () => const LinearProgressIndicator(),
              data: (data) {
                return CustomScrollView(
                  slivers: [
                    SliverFixedExtentList(
                      itemExtent: 78, // I'm forcing item heights
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Card(
                            elevation: .25,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).cardColor,
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                leading: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                subtitle: Text(
                                  data[index].description ??
                                      "No description found..",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                trailing: const Icon(Iconsax.arrow_21),
                                onTap: () => GoRouter.of(context).pushNamed(
                                  "ACCOUNTS-CHILD",
                                  extra: {'account': data[index]},
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: data.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
