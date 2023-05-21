import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/config/app_info.dart';
import 'package:squirrelwheelchair/view/slivers/license_list.dart';

void main() {
  for (var entry in licenseEntries) {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString(entry.asset);
      yield LicenseEntryWithLineBreaks(entry.packages, license);
    });
  }

  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LicenseList shows the licenses that this app depends on.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(LicenseList()),
    )));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
    expect(find.textContaining('squirrelwheelchair'), findsNothing);

    await tester.pump();

    expect(find.textContaining('squirrelwheelchair'), findsOneWidget);
  });
}
