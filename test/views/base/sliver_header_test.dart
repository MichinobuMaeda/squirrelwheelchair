import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:squirrelwheelchair/repositories/firebase_provider.dart';
import 'package:squirrelwheelchair/models/app_state.dart';
import 'package:squirrelwheelchair/view_models/app_state_provider.dart';
import 'package:squirrelwheelchair/views/router.dart';

import '../../test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SectionTitle shows the given title.',
      (WidgetTester tester) async {
    final intl = await getAppLocalization();

    await tester.pumpWidget(testHookBuilder(
      router,
      [
        appStateProvider.overrideWith((ref) => AppState.loaded),
        firebaseProvider.overrideWith((ref) => mockFirebase),
      ],
    ));

    expect(find.text(intl.appName), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsNothing);

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.byIcon(Icons.info), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsNothing);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsNothing);

    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text(intl.appName), findsOneWidget);
    expect(find.text('Version: for test'), findsNothing);
  });
}
