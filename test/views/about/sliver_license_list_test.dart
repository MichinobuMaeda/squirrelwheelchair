import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/assets.dart';

import 'package:squirrelwheelchair/views/about/sliver_license_list.dart';

void main() {
  addLicenseEntries(licenseAssets);

  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LicenseList shows the licenses that this app depends on.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(
      testRouter(const TestScreen(SliverLicenseList())),
      [],
    ));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
    expect(find.textContaining('squirrelwheelchair'), findsNothing);

    await tester.pump();

    expect(find.textContaining('squirrelwheelchair'), findsOneWidget);
  });
}
