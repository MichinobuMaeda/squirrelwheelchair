import 'package:cloud_functions/cloud_functions.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:squirrelwheelchair/repositories/firebase_provider.dart';

final mockFirebase = FirebaseServices(
  MockFirebaseAuth(),
  FakeFirebaseFirestore(),
  MockFirebaseStorage(),
  FirebaseFunctions.instance,
);

Future<AppLocalizations> getAppLocalization({String lang = 'en'}) =>
    AppLocalizations.delegate.load(Locale(lang));

class TestScreen extends StatelessWidget {
  final Widget target;
  const TestScreen(this.target, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[target],
      ),
    );
  }
}

GoRouter testRouter(Widget screen) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: screen,
          ),
        ),
      ],
    );

ProviderScope testHookBuilder(
  GoRouter router,
  List<Override> overrides, {
  String? lang,
}) =>
    ProviderScope(
      overrides: overrides,
      child: MaterialApp.router(
        title: 'Test title',
        routerConfig: router,
        locale: Locale(lang ?? 'en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
