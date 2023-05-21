import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<String> privacyPolicy(String langCode) => rootBundle.loadString(
      'assets/privacy_policy-$langCode.md',
    );

class LicenseEntry {
  final String asset;
  final List<String> packages;
  const LicenseEntry(this.asset, this.packages);
}

const List<LicenseEntry> licenseEntries = [
  LicenseEntry('LICENSE', ['squirrelwheelchair']),
  LicenseEntry('assets/fonts/OFL.txt', ['Noto Sans JP']),
];

void addLicenses(List<LicenseEntry> licenseEntries) {
  for (var entry in licenseEntries) {
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(
        entry.packages,
        await rootBundle.loadString(entry.asset),
      );
    });
  }
}
