import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/ui/screen/onboard/settings_screen.dart';
import '../home/home_page.dart';

import 'onboard_controller.dart';
import 'splash_screen.dart';

class OnBoardScreen extends ConsumerWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appData = ref.watch(inttAppProvider);

    return Scaffold(
      body: appData.when(
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const SplashScreen(),
        data: (data) {
          //--Has Profile
          if (data.checkProfileExist == false) {
            return const BasicSettingsScreen();
          }

          //--Goto Home
          return const HomePage();
          // return const SplashScreen();
        },
      ),
    );
  }
}
