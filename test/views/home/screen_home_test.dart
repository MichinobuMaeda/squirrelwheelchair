import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/home/screen_home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(const ScreenHome()),
      [],
    ));

    // TODO:
  });
}
