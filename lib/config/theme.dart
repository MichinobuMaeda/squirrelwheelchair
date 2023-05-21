import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

const seedColor = Colors.blueGrey;

const fontFamily = 'NotoSans';

const textTheme = TextTheme(
  bodySmall: TextStyle(fontSize: 14),
  bodyMedium: TextStyle(fontSize: 18),
  bodyLarge: TextStyle(fontSize: 20),
);

const edgeInsetsInnerScrollPane = EdgeInsets.symmetric(
  vertical: 4,
  horizontal: 16,
);

Color stripedBackground(BuildContext context, int index) => index.isOdd
    ? Theme.of(context).colorScheme.surfaceVariant
    : Theme.of(context).colorScheme.background;

Color linkColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.light
        ? Colors.blue.shade800
        : Colors.lightBlue.shade300;

MarkdownStyleSheet markdownStyleSheet(BuildContext context) =>
    MarkdownStyleSheet(
      p: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h1: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h2: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h3: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h4: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h5: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      h6: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      code: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      a: TextStyle(color: linkColor(context)),
    );

void onTapLink(String text, String? href, String? title) {
  if (href != null) {
    launchUrl(Uri.parse(href));
  }
}
