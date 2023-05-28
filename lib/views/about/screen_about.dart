import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base/screen_base.dart';
import '../widgets/sliver_title.dart';
import 'sliver_logo.dart';
import 'sliver_version.dart';
import 'sliver_privacy_policy.dart';
import 'sliver_license_list.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);

    return ScreenBase(
      guardNone,
      [
        // SliverTitle(intl.aboutThisApp),
        const SliverVersion(),
        const SliverLogo(),
        const SliverPrivacyPolicy(),
        SliverTitle(intl.licenses),
        const SliverLicenseList(),
      ],
    );
  }
}
