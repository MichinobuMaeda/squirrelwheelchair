import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/firebase.dart';
import 'generated/l10n.dart';
import 'view/assets.dart';
import 'view/screen_base.dart';
import 'view/router.dart';
import 'view/style.dart';

void main() {
  addLicenses(licenseEntries);
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: ScreenBase.appName,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: router,
      );
}
