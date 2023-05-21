import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:squirrelwheelchair/generated/l10n.dart';

Future<S> getAppLocalization({String? lang}) =>
    S.delegate.load(Locale(lang ?? 'en'));

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

ProviderScope testHookBuilder(GoRouter router, {String? lang}) => ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        locale: Locale(lang ?? 'en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
