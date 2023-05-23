import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SETTINGS"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "App Configuration",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
                    onTap: () => GoRouter.of(context).pushNamed('SETTINGS'),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Currency Settings",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Date Format",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Currency Format",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Default Language",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Application Theme",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Set Theme more Dar / Light"),
                  ),
                ),
                Card(
                  elevation: .25,
                  child: ListTile(
                    title: Text(
                      "Backup & Restore",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Application settings"),
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
