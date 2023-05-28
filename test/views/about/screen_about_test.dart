import 'package:flutter_test/flutter_test.dart';

import 'package:squirrelwheelchair/env.dart';
import 'package:squirrelwheelchair/views/about/screen_about.dart';

import '../../test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AboutScreen', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(const ScreenAbout()),
      [],
    ));

    expect(find.text('Version: $version'), findsOneWidget);
  });
}
