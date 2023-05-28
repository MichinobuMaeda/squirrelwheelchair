import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_models/update_app_provider.dart';

class SliverUpdateApp extends HookConsumerWidget {
  const SliverUpdateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = AppLocalizations.of(context);
    final thm = Theme.of(context);
    final updateApp = ref.watch(updateAppProvider);

    return SliverToBoxAdapter(
      child: Container(
        height: 64,
        color: thm.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  thm.colorScheme.error.withAlpha(168)),
            ),
            onPressed: updateApp,
            child: Text(intl.updateThisApp),
          ),
        ),
      ),
    );
  }
}
