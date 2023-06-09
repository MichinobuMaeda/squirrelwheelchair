import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/about/sliver_privacy_policy.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('PrivacyPolicy shows the text of the asset.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(
      testRouter(const TestScreen(SliverPrivacyPolicy())),
      [],
    ));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
    expect(
      find.textContaining('Privacy', findRichText: true),
      findsNothing,
    );

    await tester.pump();

    expect(
      find.textContaining('Privacy', findRichText: true),
      findsOneWidget,
    );
  });
}
