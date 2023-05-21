import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/view/slivers/markdown_section.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MarkdownSection shows the given title.',
      (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(
        MarkdownSection("""
# Test source

[Test link](https://example.com)
"""),
      ),
    )));

    expect(find.textContaining('source', findRichText: true), findsOneWidget);
    tester.tap(find.textContaining('Test link', findRichText: true));
  });
}
