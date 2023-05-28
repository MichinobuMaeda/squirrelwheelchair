import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../assets.dart';

part 'privacy_policy_provider.g.dart';

@Riverpod(keepAlive: true)
Future<String> privacyPolicy(
  PrivacyPolicyRef ref, {
  required String lang,
}) =>
    loadPrivacyPolicy(lang);
