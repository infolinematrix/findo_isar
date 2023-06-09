import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/annotated_region.dart';
import 'transaction_controller.dart';

class SelectableAccount extends StatelessWidget {
  const SelectableAccount({Key? key, required this.accountType})
      : super(key: key);

  final String accountType;

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SELECT ACCOUNT"),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                stretch: true,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 0),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Search..',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  suffixIcon: Icon(
                                    Iconsax.search_normal,
                                    size: 24,
                                  ),
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                                onChanged: (value) {
                                  ref
                                      .watch(searchStringProvider.notifier)
                                      .update((state) => value);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
              // SliverToBoxAdapter(child: UIHelper.verticalSpaceMedium()),
              Consumer(
                builder: (context, ref, child) {
                  final account =
                      ref.watch(selectableAccountsProvider(accountType));
                  return account.when(
                    error: (error, stackTrace) => SliverToBoxAdapter(
                      child: ErrorWidget(error),
                    ),
                    loading: () => const SliverToBoxAdapter(
                      child: LinearProgressIndicator(),
                    ),
                    data: (data) {
                      return SliverList.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: .25,
                            child: ListTile(
                              onTap: () {
                                switch (accountType) {
                                  case 'EXPENDITURE':
                                    GoRouter.of(context).pushNamed(
                                        'EXPENSES-ENTRY',
                                        extra: {'account': data[index]});
                                    break;
                                  case 'INCOME':
                                    GoRouter.of(context).pushNamed(
                                        'INCOME-ENTRY',
                                        extra: {'account': data[index]});
                                    break;
                                }
                              },
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                                child: Center(
                                  child: Text(
                                    data[index].name![0].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              title: Text(
                                data[index].name!,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              subtitle: Text(
                                data[index].description != null
                                    ? data[index].description!
                                    : 'No description found..',
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor),
                              ),
                              // trailing: const Icon(Iconsax.arrow_21),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
