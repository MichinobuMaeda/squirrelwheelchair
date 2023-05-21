import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/view/about/sliver_license_list.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('invalid path');
    yield LicenseEntryWithLineBreaks(['dummy'], license);
    throw Error();
  });

  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LicenseList shows the default error message for system error.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(SliverLicenseList()),
    )));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
    expect(find.textContaining('squirrelwheelchair'), findsNothing);

    await tester.pump();

    expect(
      find.textContaining('${S.defaultErrorMessage}'),
      findsOneWidget,
    );
  });
}
