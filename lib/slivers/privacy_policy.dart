import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../config/theme.dart';
import 'markdown_section.dart';
import 'loading_message.dart';

class PrivacyPolicy extends HookConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langCode = Localizations.localeOf(context).toString();
    final privacyPolicy = useFuture(
      rootBundle.loadString('assets/privacy_policy-$langCode.md'),
    );
    return privacyPolicy.data == null
        ? const LoadingMessage()
        : MarkdownSection(privacyPolicy.data ?? "", onTapLink: onTapLink);
  }
}
