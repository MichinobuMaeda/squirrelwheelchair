import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../assets.dart';
import '../style.dart';
import '../widgets/sliver_loading_message.dart';
import '../widgets/sliver_markdown.dart';

class SliverPrivacyPolicy extends HookConsumerWidget {
  const SliverPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final body = useFuture(
      privacyPolicy(Localizations.localeOf(context).toString()),
    );
    return body.data == null
        ? const SliverLoadingMessage()
        : SliverMarkdown(body.data ?? "", onTapLink: onTapLink);
  }
}
