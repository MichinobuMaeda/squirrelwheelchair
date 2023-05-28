import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/app_state.dart';
import '../repositories/conf_provider.dart';
import '../repositories/auth_state_provider.dart';

part 'app_state_provider.g.dart';

@riverpod
Future<AppState> appState(AppStateRef ref) async {
  await ref.watch(confProvider.future);
  final authStatus = await ref.watch(
    authStateProvider.future,
  );
  if (authStatus.account == null) return AppState.loaded;
  return AppState.user;
}
