import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/conf_provider.dart';

part 'ui_version_provider.g.dart';

@riverpod
Future<String> uiVersion(UiVersionRef ref) =>
    ref.watch(confProvider.selectAsync((conf) => conf.uiVersion));
