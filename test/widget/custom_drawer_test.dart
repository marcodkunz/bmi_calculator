import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/test_widget_app.dart';

void main() {
  group('CustomDrawer', () {
    testWidgets('build test', (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestApp().createTestApp(CustomDrawer()),
      );
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Info'), findsOneWidget);
      expect(find.text('Calculate'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
    });
  });
}
