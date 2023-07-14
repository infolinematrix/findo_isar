import 'package:flutter/material.dart';
import '../../models/accounts_model.dart';

import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Widget accountItem(BuildContext context, AccountsModel account) {
  return Card(
    elevation: .25,
    child: ListTile(
      // contentPadding:
      //     const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: Center(
          child: Text(
            account.name![0],
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      title: Text(
        account.name!.toString(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        account.description ?? "No description found..",
        // style: TextStyle(
        //     color: Theme.of(context).disabledColor),
      ),
      trailing: account.hasChild == true ? const Icon(Iconsax.arrow_21) : null,
      onTap: () => account.hasChild == true
          ? GoRouter.of(context).pushNamed(
              "ACCOUNTS-CHILD",
              extra: {'account': account},
            )
          : null,
    ),
  );
}
