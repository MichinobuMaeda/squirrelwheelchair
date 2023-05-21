import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';
import 'package:squirrelwheelchair/screens/login_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const LoginScreen(),
    )));

    // TODO:
  });
}
