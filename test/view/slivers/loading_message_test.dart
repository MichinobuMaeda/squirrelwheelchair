import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/view/slivers/loading_message.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('LoadingMessage shows the default loading message.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(testRouter(
      const TestScreen(LoadingMessage()),
    )));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
  });

  testWidgets(
      'LoadingMessage shows the default loading message'
      ' in given Language.', (WidgetTester tester) async {
    final S = await getAppLocalization(lang: 'ja');

    await tester.pumpWidget(testHookBuilder(
      testRouter(
        const TestScreen(LoadingMessage()),
      ),
      lang: 'ja',
    ));

    expect(find.text(S.defaultLoadingMessage), findsOneWidget);
  });
}
