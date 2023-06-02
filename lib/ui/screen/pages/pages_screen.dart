import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/annotated_region.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PAGES"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
            child: ListView(
              children: [
                ListTile(
                  onTap: () => GoRouter.of(context).pushNamed("ABOUT"),
                  title: const Text("About Findo"),
                ),
                const ListTile(
                  title: Text("Data Safety"),
                ),
                const ListTile(
                  title: Text("Help & Tutorial"),
                ),
                const ListTile(
                  title: Text("Contact Us"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
