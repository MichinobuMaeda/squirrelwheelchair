import 'package:go_router/go_router.dart';
import 'view/screens/about_screen.dart';
import 'view/screens/home_screen.dart';

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
