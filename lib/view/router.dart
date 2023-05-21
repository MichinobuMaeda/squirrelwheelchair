import 'package:go_router/go_router.dart';
import 'about/screen_about.dart';
import 'home/screen_home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const ScreenHome(),
      ),
      routes: [
        GoRoute(
          path: 'about',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ScreenAbout(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => NoTransitionPage(
    key: state.pageKey,
    child: const ScreenHome(),
  ),
);
