import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'repositories/firebase_util.dart';
import 'view_models/update_app_provider.dart';
import 'views/router.dart';
import 'views/style.dart';
import 'assets.dart';
import 'env.dart';
import 'platforms.dart';
import 'logger.dart';

void main() async {
  bool test = version == 'for test';

  addLicenseEntries(licenseAssets);
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase(test: test);
  final intl = await AppLocalizations.delegate.load(const Locale('en'));

  runApp(
    ProviderScope(
      observers: [
        if (test) ProviderLogger(),
      ],
      overrides: [
        updateAppProvider.overrideWith((ref) => updateWebApp),
      ],
      child: MyApp(title: intl.appName),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
