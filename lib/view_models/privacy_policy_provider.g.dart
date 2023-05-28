// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$privacyPolicyHash() => r'f7f97a940b47f00e4b0f53da75400d11167e4b8e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef PrivacyPolicyRef = FutureProviderRef<String>;

/// See also [privacyPolicy].
@ProviderFor(privacyPolicy)
const privacyPolicyProvider = PrivacyPolicyFamily();

/// See also [privacyPolicy].
class PrivacyPolicyFamily extends Family<AsyncValue<String>> {
  /// See also [privacyPolicy].
  const PrivacyPolicyFamily();

  /// See also [privacyPolicy].
  PrivacyPolicyProvider call({
    required String lang,
  }) {
    return PrivacyPolicyProvider(
      lang: lang,
    );
  }

  @override
  PrivacyPolicyProvider getProviderOverride(
    covariant PrivacyPolicyProvider provider,
  ) {
    return call(
      lang: provider.lang,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'privacyPolicyProvider';
}

/// See also [privacyPolicy].
class PrivacyPolicyProvider extends FutureProvider<String> {
  /// See also [privacyPolicy].
  PrivacyPolicyProvider({
    required this.lang,
  }) : super.internal(
          (ref) => privacyPolicy(
            ref,
            lang: lang,
          ),
          from: privacyPolicyProvider,
          name: r'privacyPolicyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$privacyPolicyHash,
          dependencies: PrivacyPolicyFamily._dependencies,
          allTransitiveDependencies:
              PrivacyPolicyFamily._allTransitiveDependencies,
        );

  final String lang;

  @override
  bool operator ==(Object other) {
    return other is PrivacyPolicyProvider && other.lang == lang;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lang.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
