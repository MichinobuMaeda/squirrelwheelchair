import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String fontNameNotoSans = 'NotoSans';

const assetImageLogo = AssetImage('assets/images/logo-192.png');

Future<String> loadPrivacyPolicy(String langCode) => rootBundle.loadString(
      'assets/privacy_policy-$langCode.md',
    );

class LicenseAsset {
  final String asset;
  final List<String> packages;
  const LicenseAsset(this.asset, this.packages);
}

const List<LicenseAsset> licenseAssets = [
  LicenseAsset('LICENSE', ['squirrelwheelchair']),
  LicenseAsset('assets/fonts/OFL.txt', ['Noto Sans JP']),
];

void addLicenseEntries(List<LicenseAsset> licenseAssets) {
  for (var entry in licenseAssets) {
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(
        entry.packages,
        await rootBundle.loadString(entry.asset),
      );
    });
  }
}
