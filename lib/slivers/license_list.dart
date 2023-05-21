import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme.dart';
import 'loading_message.dart';
import 'error_message.dart';

class _LicenseDescription {
  final String title;
  final String body;
  const _LicenseDescription(this.title, this.body);
}

final licenseListProvider = StreamProvider<List<_LicenseDescription>>(
  (ref) async* {
    List<_LicenseDescription> licenseList = [];
    late int count = 0;
    await for (final entry in LicenseRegistry.licenses) {
      licenseList.add(_LicenseDescription(
        entry.packages.toList().join(', '),
        entry.paragraphs.toList().map((e) => e.text.trim()).join('\n\n'),
      ));
      if (++count % 10 == 0) yield licenseList;
    }
    yield licenseList;
  },
);

class LicenseList extends HookConsumerWidget {
  const LicenseList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final licenseList = ref.watch(licenseListProvider);
    return licenseList.when(
      loading: () => const LoadingMessage(),
      error: (error, stackTrace) => ErrorMessage(error, stackTrace),
      data: (data) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => Container(
            padding: edgeInsetsInnerScrollPane,
            color: stripedBackground(context, index),
            height: 128.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data[index].body,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
          childCount: data.length,
        ),
      ),
    );
  }
}
