import 'package:flutter/material.dart';

import '../style.dart';
import '../../generated/l10n.dart';

class SliverErrorMessage extends StatelessWidget {
  final String? message;
  final Object error;
  final StackTrace? stackTrace;
  const SliverErrorMessage(this.error, this.stackTrace,
      {super.key, this.message});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          padding: edgeInsetsInnerScrollPane,
          color: Theme.of(context).colorScheme.errorContainer,
          height: scrollPaneHeightNarrow,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              [
                message ?? S.of(context).defaultErrorMessage,
                error.toString(),
                stackTrace.toString(),
              ].join('\n\n'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ),
      );
}
