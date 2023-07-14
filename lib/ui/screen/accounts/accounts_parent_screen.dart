import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/account_item.dart';
import '../../widgets/annotated_region.dart';
import 'accounts_controller.dart';

class AccountsParentScreen extends ConsumerWidget {
  const AccountsParentScreen({Key? key, required this.title}) : super(key: key);
  // final int parent;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(rootAccountsProvider);
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
              data: (accounts) {
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return accountItem(context, accounts[index]);
                      }, childCount: accounts.length // 1000 list items
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
