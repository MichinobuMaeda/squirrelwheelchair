import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/about/sliver_license_list.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('invalid path');
    yield LicenseEntryWithLineBreaks(['dummy'], license);
    throw Error();
  });

  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LicenseList shows the default loading message for system error.',
      (WidgetTester tester) async {
    final intl = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(
      testRouter(const TestScreen(SliverLicenseList())),
      [],
    ));

    expect(find.text(intl.defaultLoadingMessage), findsOneWidget);
    expect(find.textContaining('squirrelwheelchair'), findsNothing);

    await tester.pump();

    expect(
      find.textContaining(intl.defaultErrorMessage),
      findsOneWidget,
    );
  });
}
