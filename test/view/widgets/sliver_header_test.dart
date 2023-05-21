import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_app.dart';
import 'package:squirrelwheelchair/view/router.dart';
import 'package:squirrelwheelchair/view/screen_base.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SectionTitle shows the given title.',
      (WidgetTester tester) async {
    final S = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(router));

    expect(find.text(ScreenBase.appName), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    expect(find.text(ScreenBase.appName), findsOneWidget);
    expect(find.text(S.aboutThisApp), findsNothing);

    expect(find.byIcon(Icons.info), findsOneWidget);
    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    expect(find.text(ScreenBase.appName), findsOneWidget);
    expect(find.text(S.aboutThisApp), findsOneWidget);

    expect(find.byIcon(Icons.info), findsOneWidget);
    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    expect(find.text(ScreenBase.appName), findsOneWidget);
    expect(find.text(S.aboutThisApp), findsOneWidget);
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    expect(find.text(ScreenBase.appName), findsOneWidget);
    expect(find.text(S.aboutThisApp), findsNothing);
  });
}
