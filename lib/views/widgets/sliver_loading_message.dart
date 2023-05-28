import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SliverLoadingMessage extends StatelessWidget {
  final String? message;
  const SliverLoadingMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final thm = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        color: thm.colorScheme.surfaceVariant,
        height: 48,
        child: Center(
          child: Text(
            message ?? intl.defaultLoadingMessage,
            style: TextStyle(
              color: thm.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
