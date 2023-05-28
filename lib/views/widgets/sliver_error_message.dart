import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../style.dart';

class SliverErrorMessage extends StatelessWidget {
  final String? message;
  final Object error;
  final StackTrace? stackTrace;
  const SliverErrorMessage(this.error, this.stackTrace,
      {super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final thm = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: edgeInsetsInnerScrollPane,
        color: thm.colorScheme.errorContainer,
        height: scrollPaneHeightNarrow,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            [
              message ?? intl.defaultErrorMessage,
              error.toString(),
              stackTrace.toString(),
            ].join('\n\n'),
            style: TextStyle(
              color: thm.colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}
