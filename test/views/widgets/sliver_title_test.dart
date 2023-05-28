import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/widgets/sliver_title.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SectionTitle shows the given title.',
      (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(
        const TestScreen(
          SliverTitle('Test title'),
        ),
      ),
      [],
    ));

    expect(find.text('Test title'), findsOneWidget);
  });
}
