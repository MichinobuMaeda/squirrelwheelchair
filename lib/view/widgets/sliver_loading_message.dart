import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class SliverLoadingMessage extends StatelessWidget {
  final String? message;
  const SliverLoadingMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          height: 48,
          child: Center(
            child: Text(
              message ?? S.of(context).defaultLoadingMessage,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
}
