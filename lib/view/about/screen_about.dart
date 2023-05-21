import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../screen_base.dart';
import '../widgets/sliver_title.dart';
import 'sliver_privacy_policy.dart';
import 'sliver_license_list.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) => ScreenBase([
        SliverTitle(S.of(context).aboutThisApp),
        const SliverPrivacyPolicy(),
        SliverTitle(S.of(context).licenses),
        const SliverLicenseList(),
      ]);
}
