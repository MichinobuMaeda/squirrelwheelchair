import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../generated/l10n.dart';
import '../slivers/main_app_bar.dart';
import '../slivers/license_list.dart';
import '../slivers/footer.dart';
import '../slivers/section_title.dart';
import '../slivers/privacy_policy.dart';

class AboutScreen extends HookConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const MainAppBar(),
            SectionTitle(S.of(context).aboutThisApp),
            const PrivacyPolicy(),
            SectionTitle(S.of(context).licenses),
            const LicenseList(),
            const Footer(),
          ],
        ),
      );
}
