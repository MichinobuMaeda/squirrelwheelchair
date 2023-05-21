import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/view/about/screen_about.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AboutScreen', (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const ScreenAbout(),
    )));

    expect(find.text(S.aboutThisApp), findsOneWidget);
  });
}
