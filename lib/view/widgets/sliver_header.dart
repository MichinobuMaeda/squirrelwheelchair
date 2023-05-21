import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

const double iconButtonSize = 40.0;

class SliverHeader extends StatelessWidget {
  final String appName;
  const SliverHeader(this.appName, {super.key});

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
          titlePadding: const EdgeInsets.all(12),
          background: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(
                        Icons.home,
                        size: iconButtonSize,
                      ),
                      tooltip: S.of(context).home,
                      onPressed: GoRouter.of(context).location == '/'
                          ? null
                          : () => context.go('/'),
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(
                        Icons.account_circle,
                        size: iconButtonSize,
                      ),
                      tooltip: 'Account',
                      onPressed: null,
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(
                        Icons.settings,
                        size: iconButtonSize,
                      ),
                      tooltip: 'Settings',
                      onPressed: null,
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(
                        Icons.info,
                        size: iconButtonSize,
                      ),
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
