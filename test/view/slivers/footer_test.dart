import 'package:flutter_test/flutter_test.dart';

import 'package:squirrelwheelchair/config/app_info.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/view/slivers/footer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Footer shows the copyright.', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(Footer()),
    )));

    expect(find.text(copyright), findsOneWidget);
  });
}
