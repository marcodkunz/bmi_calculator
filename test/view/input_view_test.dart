import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/view/input_view.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:bmi_calculator/widget/custom_slider.dart';
import 'package:bmi_calculator/widget/custom_textformfield.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock_implementations.mocks.dart';
import '../helper/test_widget_app.dart';

void main() {
  late MockInputViewModel _viewModel;
  late Widget _view;
  late FocusNode _ageFocusNode;
  late FocusNode _weightFocusNode;

  setUp(() {
    _ageFocusNode = FocusNode();
    _weightFocusNode = FocusNode();

    _viewModel = MockInputViewModel();
    _view = WidgetTestApp().createTestApp(InputView(_viewModel));

    when(_viewModel.currentHeight).thenReturn(170);
    when(_viewModel.currentAge).thenReturn(25);
    when(_viewModel.currentWeight).thenReturn(80);
    when(_viewModel.colorFemaleCard).thenReturn(ColorStyles.petrol);
    when(_viewModel.colorMaleCard).thenReturn(ColorStyles.petrol);
    when(_viewModel.ageFocusNode).thenReturn(_ageFocusNode);
    when(_viewModel.weightFocusNode).thenReturn(_weightFocusNode);
    when(_viewModel.colorMaleCard).thenReturn(ColorStyles.petrol);

    when(_viewModel.minHeight).thenReturn(80);
    when(_viewModel.maxHeight).thenReturn(272);
    when(_viewModel.minAge).thenReturn(1);
    when(_viewModel.maxAge).thenReturn(120);
    when(_viewModel.minWeight).thenReturn(10);
    when(_viewModel.maxWeight).thenReturn(450);

    when(_viewModel.isValid).thenReturn(false);
  });

  group('build test', () {
    testWidgets('ErrorState', (tester) async {
      when(_viewModel.state).thenReturn(ErrorState(EmptyFailure()));

      await tester.pumpWidget(_view);

      expect(find.text('Something went wrong'), findsOneWidget);
    });
    testWidgets('LoadedState', (tester) async {
      when(_viewModel.state).thenReturn(LoadedState());

      await tester.pumpWidget(_view);

      expect(find.widgetWithIcon(RoundedCard, Icons.female), findsOneWidget);
      expect(find.widgetWithIcon(RoundedCard, Icons.male), findsOneWidget);

      expect(find.text('Height:'), findsOneWidget);
      expect(find.text('170 cm'), findsOneWidget);
      expect(find.byType(CustomSlider), findsOneWidget);

      expect(find.text('Age:'), findsOneWidget);
      expect(find.text('Weight:'), findsOneWidget);
      expect(find.byType(CustomTextFormField), findsNWidgets(2));

      expect(find.byType(CustomButton), findsOneWidget);
    });
  });

  testWidgets('input age', (tester) async {
    when(_viewModel.state).thenReturn(LoadedState());

    await tester.pumpWidget(_view);
    await tester.enterText(find.byType(TextFormField).first, '30');

    verify(_viewModel.onAgeChanged('30'));
  });

  testWidgets('input weight', (tester) async {
    when(_viewModel.state).thenReturn(LoadedState());

    await tester.pumpWidget(_view);
    await tester.enterText(find.byType(TextFormField).last, '75');

    verify(_viewModel.onWeightChanged('75'));
  });

  group('onCalculate()', () {
    testWidgets('with valid model', (tester) async {
      when(_viewModel.state).thenReturn(LoadedState());
      when(_viewModel.isValid).thenReturn(true);

      await tester.pumpWidget(_view);
      await tester.tap(find.byType(CustomButton));

      verify(_viewModel.onCalculate());
    });
    testWidgets('with invalid model', (tester) async {
      when(_viewModel.state).thenReturn(LoadedState());
      when(_viewModel.isValid).thenReturn(false);

      await tester.pumpWidget(_view);
      await tester.tap(find.byType(CustomButton));

      verifyNever(_viewModel.onCalculate());
    });
  });
}
