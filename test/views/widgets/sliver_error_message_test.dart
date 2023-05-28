import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';

import 'package:squirrelwheelchair/views/widgets/sliver_error_message.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ErrorMessage shows default error message.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(
      testRouter(
        TestScreen(
          SliverErrorMessage(
            'Test error',
            StackTrace.fromString('Test stack trace'),
          ),
        ),
      ),
      [],
    ));

    expect(
      find.text('${S.defaultErrorMessage}\n\nTest error\n\nTest stack trace'),
      findsOneWidget,
    );
  });

  testWidgets('ErrorMessage shows given error message.',
      (WidgetTester tester) async {
    await tester.pumpWidget(testHookBuilder(
      testRouter(
        TestScreen(
          SliverErrorMessage(
            'Test error',
            StackTrace.fromString('Test stack trace'),
            message: 'Test message',
          ),
        ),
      ),
      [],
    ));

    expect(
      find.text('Test message\n\nTest error\n\nTest stack trace'),
      findsOneWidget,
    );
  });
}
