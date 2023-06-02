import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'statement_controller.dart';

class SelectAccountStatementScreen extends StatelessWidget {
  const SelectAccountStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 16, top: 16),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  stretch: true,
                  flexibleSpace: Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 4),
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
                                  suffixIcon:
                                      Icon(Iconsax.search_normal, size: 18)),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final data = ref.watch(accountsProvider);
                      return data.when(
                        error: (error, stackTrace) => ErrorWidget(error),
                        loading: () => const LinearProgressIndicator(),
                        data: (accounts) {
                          return Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: ListView.builder(
                              itemCount: accounts.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return AccountItem(
                                  account: accounts[index],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
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

class AccountItem extends StatelessWidget {
  final AccountsModel account;

  const AccountItem({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .25,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        onTap: () => GoRouter.of(context)
            .pushNamed('ACCOUNT-STATEMENT', extra: {'account': account}),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: Center(
            child: Text(
              account.name![0],
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text(
          account.name!,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          account.description ?? 'No description found',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
