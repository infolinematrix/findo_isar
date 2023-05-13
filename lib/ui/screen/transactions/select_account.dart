import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/annotated_region.dart';

class SelectAccount extends StatelessWidget {
  const SelectAccount({Key? key, required this.entryType}) : super(key: key);

  final String? entryType;

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SELECT ACCOUNT"),
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
                        left: 18, right: 18, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search..',
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Iconsax.search_normal,
                              size: 24,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    // margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 18, bottom: 16),
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: ListTile(
                            onTap: () => GoRouter.of(context)
                                .pushNamed(entryType.toString()),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                child: Text(
                                  "A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              "Account Head",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            subtitle: Text(
                              "Short description of account",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: const Icon(Iconsax.arrow_21),
                          ),
                        );
                      },
                    ),
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
