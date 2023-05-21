import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_info.dart';
import '../../generated/l10n.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: false,
        snap: false,
        floating: true,
        expandedHeight: 108.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            appName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          centerTitle: true,
          titlePadding: const EdgeInsets.all(8),
          background: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.home),
                      tooltip: S.of(context).home,
                      onPressed: GoRouter.of(context).location == '/'
                          ? null
                          : () => context.go('/'),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.account_circle),
                      tooltip: 'Account',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.settings),
                      tooltip: 'Settings',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.info),
                      tooltip: S.of(context).aboutThisApp,
                      onPressed: GoRouter.of(context).location == '/about'
                          ? null
                          : () => context.go('/about'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
