import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SETTINGS"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "App Configuration",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "Application settings",
                    ),
                    onTap: () => GoRouter.of(context).pushNamed('CONFIG'),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Cash in Hand",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "Update Opening balance of Cash in Hand",
                    ),
                    onTap: () => GoRouter.of(context).pushNamed('CASH-IN-HAND'),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Consistency Check",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "It will check transactions on selected account and update closing balance.",
                    ),
                    onTap: () =>
                        GoRouter.of(context).pushNamed('CONSISTENCY-CHECK'),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Default Language",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "Application settings",
                    ),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Application Theme",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "Set Theme more Dar / Light",
                    ),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Backup & Restore",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      "Application settings",
                    ),
                    onTap: () => GoRouter.of(context).pushNamed('BACKUP'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
