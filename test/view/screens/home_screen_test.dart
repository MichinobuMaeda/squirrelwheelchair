import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/view/screens/home_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const HomeScreen(),
    )));

    // TODO:
  });
}
