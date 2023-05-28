import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/account.dart';
import 'firebase_provider.dart';
import 'user_provider.dart';

part 'auth_state_provider.g.dart';

@immutable
class AuthState {
  final Account? account;

  const AuthState(this.account);

  @override
  int get hashCode => Object.hash('seed', account);

  @override
  bool operator ==(Object other) =>
      other is AuthState && other.account == account;
}

@Riverpod(keepAlive: true)
Future<AuthState> authState(AuthStateRef ref) async {
  final firebase = ref.watch(firebaseProvider);
  final uid = await ref.watch(userProvider.selectAsync((user) => user?.uid));
  final account = Account.fromDoc(uid == null
      ? null
      : await firebase.db.collection('accounts').doc(uid).get());
  return account?.alive == true ? AuthState(account) : const AuthState(null);
}
