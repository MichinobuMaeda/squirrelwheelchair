import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/app_info.dart';
import 'config/theme.dart';
import 'config/firebase_options.dart';
import 'generated/l10n.dart';
import 'router.dart';

void main() {
  for (var entry in licenseEntries) {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString(entry.asset);
      yield LicenseEntryWithLineBreaks(entry.packages, license);
    });
  }

  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (version == 'for test') {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  } else {
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: webRecaptchaSiteKey,
    );
  }
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  fontFamily: fontFamily,
  textTheme: textTheme,
  useMaterial3: true,
);

final darkTheme = theme.copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: appName,
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
