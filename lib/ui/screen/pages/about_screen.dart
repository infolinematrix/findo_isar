import 'package:flutter/material.dart';
import '../../../util/ui_helpers.dart';

import '../../widgets/annotated_region.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ABOUT"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                    "Managing personal finances effectively is crucial for maintaining financial stability and achieving long-term goals. One of the key aspects of financial management is tracking personal expenses and creating a budget. By employing the right tools and adopting disciplined habits, individuals can gain better control over their spending, save more, and work towards their financial aspirations."),
                UIHelper.verticalSpaceSmall(),
                const Text(
                    "Effective personal expense tracking and budget management are indispensable for financial success. By regularly monitoring expenses and creating a realistic budget, individuals can take control of their finances, reduce unnecessary spending, and make significant progress towards their financial goals. Embracing technology-driven tools and cultivating disciplined financial habits will pave the way for a more secure and prosperous future."),
                UIHelper.verticalSpaceSmall(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
