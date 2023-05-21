import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/view/widgets/sliver_footer.dart';

void main() {
  const String testCopyright = 'Test copyright';
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Footer shows the copyright.', (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(SliverFooter(testCopyright)),
    )));

    expect(find.text(testCopyright), findsOneWidget);
  });
}
