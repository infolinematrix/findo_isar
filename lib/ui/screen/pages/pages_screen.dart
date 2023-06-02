import 'package:flutter/material.dart';

import '../../widgets/annotated_region.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ABOUT"),
        ),
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("AnnotedAppRegion"),
            ],
          ),
        ),
      ),
    );
  }
}
