import 'package:flutter/material.dart';

class SliverTitle extends StatelessWidget {
  final String title;
  const SliverTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          height: 64,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
      );
}
