import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/view/widgets/sliver_loading_message.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LoadingMessage shows the default loading message.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(SliverLoadingMessage()),
    )));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
  });

  testWidgets(
      'LoadingMessage shows the default loading message'
      ' in given Language.', (WidgetTester tester) async {
    final S = await getAppLocalization(lang: 'ja');

    await tester.pumpWidget(testHookBuilder(
      testRouter(
        const TestScreen(SliverLoadingMessage()),
      ),
      lang: 'ja',
    ));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
  });
}
