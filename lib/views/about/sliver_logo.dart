import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../assets.dart';
import '../../view_models/ui_version_provider.dart';
import '../widgets/sliver_error_message.dart';
import '../widgets/sliver_loading_message.dart';

class SliverLogo extends HookConsumerWidget {
  const SliverLogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(uiVersionProvider).when<Widget>(
            data: (version) => const SliverToBoxAdapter(
              child: SizedBox(
                height: 144,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(image: assetImageLogo),
                  ),
                ),
              ),
            ),
            error: (error, stackTrace) => SliverErrorMessage(error, stackTrace),
            loading: () => const SliverLoadingMessage(),
          );
}
