import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../ui/themes.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'services/isar_database.dart';
import 'services/logger.dart';
import 'services/routes.dart';
import 'util/theme_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(
    ProviderScope(observers: [
      RiverpodLogger(),
    ], child: const App()),
  );
}

Future<void> initApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  await IsarHelper.instance.init();
  // await RemoteConfig.instance.init();
  // await NotificationService().setupInteractedMessage();
  // await AwasomeNotification.initializeLocalNotifications();
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Findo - Smart Money Manager',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      builder: EasyLoading.init(),
    );
  }
}
