import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../generated/l10n.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;
  final Object error;
  final StackTrace? stackTrace;
  const ErrorMessage(this.error, this.stackTrace, {super.key, this.message});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          padding: edgeInsetsInnerScrollPane,
          color: Theme.of(context).colorScheme.errorContainer,
          height: 128,
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
