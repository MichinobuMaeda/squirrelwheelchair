import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/widgets/sliver_markdown.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MarkdownSection shows the given title.',
      (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(
        const TestScreen(
          SliverMarkdown("""
# Test source

[Test link](https://example.com)
"""),
        ),
      ),
      [],
    ));

    expect(find.textContaining('source', findRichText: true), findsOneWidget);
    tester.tap(find.textContaining('Test link', findRichText: true));
  });
}
