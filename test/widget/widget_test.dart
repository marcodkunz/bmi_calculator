import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/test_widget_app.dart';

void main() {
  late WidgetTestApp _testApp;

  setUp(() {
    _testApp = WidgetTestApp();
  });

  testWidgets('CustomButton onClick', (WidgetTester tester) async {
    var successful = false;
    var widget =
        CustomButton(text: "Hello", onClick: () => {successful = true});
    await tester.pumpWidget(_testApp.createTestApp(widget));
    expect(find.byWidget(widget), findsOneWidget);
    await tester.tap(find.text("Hello"));
    expect(successful, isTrue);
  });
}
