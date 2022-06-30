import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomButton', () {
    testWidgets('build test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomButton(
            text: 'test',
          ),
        ),
      );
      expect(find.text('test'), findsOneWidget);
    });
    testWidgets('onClick test', (WidgetTester tester) async {
      var _clicked = false;
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomButton(
            text: 'test',
            onClick: () => _clicked = true,
          ),
        ),
      );
      await tester.tap(find.text('test'));
      expect(_clicked, isTrue);
    });
  });
}
