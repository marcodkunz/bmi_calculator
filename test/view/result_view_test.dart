import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:bmi_calculator/view/result_view.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/default_user.dart';
import '../helper/mock_implementations.mocks.dart';
import '../helper/test_widget_app.dart';

void main() {
  late MockResultViewModel _viewModel;
  late Widget _view;

  setUp(() {
    _viewModel = MockResultViewModel();
    _view = WidgetTestApp().createTestApp(ResultView(_viewModel));
  });

  group('build test', () {
    setUp(() {
      when(_viewModel.onReady(any)).thenReturn(null);
      when(_viewModel.currentEntry).thenReturn(defaultUser());
      when(_viewModel.currentCategory).thenReturn(BmiRangeCategory.overweight);
    });
    testWidgets('LoadingState', (tester) async {
      when(_viewModel.state).thenReturn(LoadingState());

      await tester.pumpWidget(_view);

      expect(find.byType(IndeterminateProgressIndicator), findsOneWidget);
    });
    testWidgets('ErrorState', (tester) async {
      when(_viewModel.state).thenReturn(ErrorState(EmptyFailure()));

      await tester.pumpWidget(_view);

      expect(find.text('Something went wrong'), findsOneWidget);
    });
    testWidgets('LoadedState', (tester) async {
      when(_viewModel.state).thenReturn(LoadedState());

      await tester.pumpWidget(_view);

      expect(find.text('Your BMI: 27.68'), findsOneWidget);
      expect(find.text('Overweight (Pre-obese)'), findsOneWidget);
      expect(find.text('Age:'), findsOneWidget);
      expect(find.text('25'), findsOneWidget);
      expect(find.text('Weight:'), findsOneWidget);
      expect(find.text('80'), findsOneWidget);
    });
  });

  testWidgets('onNameChanged', (tester) async {
    when(_viewModel.onReady(any)).thenReturn(null);
    when(_viewModel.currentEntry).thenReturn(defaultUser());
    when(_viewModel.currentCategory).thenReturn(BmiRangeCategory.overweight);
    when(_viewModel.onNameChanged(any)).thenReturn(null);
    when(_viewModel.state).thenReturn(LoadedState());

    await tester.pumpWidget(_view);
    await tester.enterText(find.byType(TextFormField), 'test');

    verify(_viewModel.onNameChanged('test'));
  });

  testWidgets('onSave', (tester) async {
    when(_viewModel.currentEntry).thenReturn(defaultUser());
    when(_viewModel.currentCategory).thenReturn(BmiRangeCategory.overweight);
    when(_viewModel.state).thenReturn(LoadedState());
    when(_viewModel.onSave()).thenReturn(null);

    await tester.pumpWidget(_view);
    await tester.tap(find.byType(CustomButton));

    verify(_viewModel.onSave());
  });
}
