import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_models/privacy_policy_provider.dart';
import '../style.dart';
import '../widgets/sliver_markdown.dart';
import '../widgets/sliver_loading_message.dart';
import '../widgets/sliver_error_message.dart';

class SliverPrivacyPolicy extends HookConsumerWidget {
  const SliverPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = AppLocalizations.of(context);

    return ref.watch(privacyPolicyProvider(lang: intl.localeName)).when(
          data: (data) => SliverMarkdown(data, onTapLink: onTapLink),
          error: (error, stackTrace) => SliverErrorMessage(error, stackTrace),
          loading: () => const SliverLoadingMessage(),
        );
  }
}
