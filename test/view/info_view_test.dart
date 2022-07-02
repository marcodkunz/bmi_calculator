import 'package:bmi_calculator/view/info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/test_widget_app.dart';

void main() {
  late Widget _view;

  setUp(() {
    _view = WidgetTestApp().createTestApp(InfoView());
  });

  testWidgets('build test', (tester) async {
    await tester.pumpWidget(_view);

    expect(find.text('Info'), findsOneWidget);

    expect(find.text('Range'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);

    expect(find.text('Underweight (Severe thinness)'), findsOneWidget);
    expect(find.text('0.0 - 16.0'), findsOneWidget);

    expect(find.text('Underweight (Moderate thinness)'), findsOneWidget);
    expect(find.text('16.01 - 16.99'), findsOneWidget);

    expect(find.text('Underweight (Mild thinness)'), findsOneWidget);
    expect(find.text('17.0 - 18.49'), findsOneWidget);

    expect(find.text('Normal range'), findsOneWidget);
    expect(find.text('18.5 - 24.99'), findsOneWidget);

    expect(find.text('Overweight (Pre-obese)'), findsOneWidget);
    expect(find.text('25.0 - 29.99'), findsOneWidget);

    expect(find.text('Obese (Class I)'), findsOneWidget);
    expect(find.text('30.0 - 34.99'), findsOneWidget);

    expect(find.text('Obese (Class II)'), findsOneWidget);
    expect(find.text('35.0 - 39.99'), findsOneWidget);

    expect(find.text('Obese (Class III)'), findsOneWidget);
    expect(find.text('40.0 - 99.99'), findsOneWidget);

  });
}
