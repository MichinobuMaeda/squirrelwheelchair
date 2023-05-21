import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';
import 'package:squirrelwheelchair/slivers/section_title.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SectionTitle shows the given title.',
      (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(
        SectionTitle('Test title'),
      ),
    )));

    expect(find.text('Test title'), findsOneWidget);
  });
}
