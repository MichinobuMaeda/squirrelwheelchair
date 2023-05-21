import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../config/theme.dart';

class MarkdownSection extends StatelessWidget {
  final String data;
  final void Function(String, String?, String)? onTapLink;

  const MarkdownSection(this.data, {super.key, this.onTapLink});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: edgeInsetsInnerScrollPane,
        color: Theme.of(context).colorScheme.background,
        height: 128,
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
