import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';
import 'package:squirrelwheelchair/screens/about_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AboutScreen', (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const AboutScreen(),
    )));

    expect(find.text(S.aboutThisApp), findsOneWidget);
  });
}
