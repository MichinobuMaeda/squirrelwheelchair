import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/sliver_header.dart';
import 'widgets/sliver_footer.dart';

class ScreenBase extends HookConsumerWidget {
  static const String appName = 'Squirrel Wheelchair';
  static const String copyright = '© 2023 Michinobu Maeda';

  final List<Widget> slivers;
  const ScreenBase(this.slivers, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverHeader(appName),
          ...slivers,
          const SliverFooter(copyright),
        ],
      ),
    );
  }
}
