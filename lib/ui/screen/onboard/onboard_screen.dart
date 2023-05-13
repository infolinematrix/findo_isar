import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/screen/home/home_page.dart';

import '../accounts/accounts_parent_screen.dart';
import 'onboard_controller.dart';
import 'splash_screen.dart';

class OnBoardScreen extends ConsumerWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(inttAppProvider);

    return Scaffold(
      body: settings.when(
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const SplashScreen(),
        data: (data) {
          if (data.hasSystemAccounts == false) {
            //--Goto
            return const AccountsParentScreen(
              parent: 0,
              title: "CATEGORIES",
            );
          } else {
            //--Goto
            return const HomePage();
          }
        },
      ),
    );
  }
}
