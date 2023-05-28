import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'firebase_provider.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> user(UserRef ref) =>
    ref.watch(firebaseProvider).auth.authStateChanges();
