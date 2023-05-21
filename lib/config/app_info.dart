const String appName = 'Squirrel Wheelchair';
const String version = 'for test';
const String copyright = '© 2023 Michinobu Maeda';
const String webRecaptchaSiteKey = '6LcTNAYmAAAAAInSA8mcOLYXiIhVcBE6S1SxlPGH';

class LicenseEntry {
  final String asset;
  final List<String> packages;
  LicenseEntry(this.asset, this.packages);
}

List<LicenseEntry> licenseEntries = [
  LicenseEntry('LICENSE', ['squirrelwheelchair']),
  LicenseEntry('assets/fonts/OFL.txt', ['Noto Sans JP']),
];
