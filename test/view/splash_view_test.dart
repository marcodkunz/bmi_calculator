import 'package:bmi_calculator/view/splash_view.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock_implementations.mocks.dart';
import '../helper/test_widget_app.dart';

void main() {
  late MockSplashViewModel _viewModel;
  late Widget _view;

  setUp(() {
    _viewModel = MockSplashViewModel();
    _view = WidgetTestApp()
        .createTestApp(SplashView(_viewModel));
  });

  testWidgets('SplashView build test', (tester) async {
    when(_viewModel.init()).thenAnswer((_) => Future.value());

    await tester.pumpWidget(_view);

    expect(find.byType(IndeterminateProgressIndicator), findsOneWidget);
    verify(_viewModel.init());
  });
}
