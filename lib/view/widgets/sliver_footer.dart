import 'package:flutter/material.dart';

class SliverFooter extends StatelessWidget {
  final String copyright;
  const SliverFooter(this.copyright, {super.key});

  @override
  Widget build(BuildContext context) => SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              copyright,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      );
}
