import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/about/screen_about.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AboutScreen', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(const ScreenAbout()),
      [],
    ));

    expect(find.textContaining('Version: for test'), findsOneWidget);
  });
}
