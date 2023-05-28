import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../style.dart';

class SliverMarkdown extends StatelessWidget {
  final String data;
  final void Function(String, String?, String)? onTapLink;

  const SliverMarkdown(this.data, {super.key, this.onTapLink});

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: edgeInsetsInnerScrollPane,
        color: thm.colorScheme.background,
        height: scrollPaneHeightNarrow,
        child: Markdown(
          data: data,
          onTapLink: onTapLink,
          padding: const EdgeInsets.all(0),
          styleSheet: markdownStyleSheet(context),
        ),
      ),
    );
  }
}
