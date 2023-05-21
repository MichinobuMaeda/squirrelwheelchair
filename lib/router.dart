import 'package:go_router/go_router.dart';
import 'screens/about_screen.dart';
import 'screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
      routes: [
        GoRoute(
          path: 'about',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const AboutScreen(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => NoTransitionPage(
    key: state.pageKey,
    child: const HomeScreen(),
  ),
);
