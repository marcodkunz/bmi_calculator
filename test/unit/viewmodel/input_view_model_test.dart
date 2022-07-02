import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock_implementations.mocks.dart';

void main() {
  late MockINavigationService _navigationService;
  late InputViewModel _viewModel;

  setUp(() {
    _navigationService = MockINavigationService();
    _viewModel = InputViewModel(_navigationService, NoLogger());
  });

  group('gender selection', () {
    test('female selection', () {
      expect(_viewModel.currentGender, null);

      _viewModel.onFemaleSelected();

      expect(_viewModel.currentGender, Gender.female);
    });
    test('male selection', () {
      expect(_viewModel.currentGender, null);

      _viewModel.onMaleSelected();

      expect(_viewModel.currentGender, Gender.male);
    });
  });

  group('height input', () {
    test('onHeightChanged in range', () {
      expect(_viewModel.currentHeight, 170);

      _viewModel.onHeightChanged(11);

      expect(_viewModel.currentHeight, 11);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onHeightCHanged below range', () {
      expect(_viewModel.currentHeight, 170);

      _viewModel.onHeightChanged(9);

      expect(_viewModel.currentHeight, 10);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onHeightCHanged below range', () {
      expect(_viewModel.currentHeight, 170);

      _viewModel.onHeightChanged(231);

      expect(_viewModel.currentHeight, 230);
      expect(_viewModel.state is LoadedState, true);
    });
  });

  group('age input', () {
    test('onAgeChanged in range', () {
      expect(_viewModel.currentAge, 25);

      _viewModel.onAgeChanged('30');

      expect(_viewModel.currentAge, 30);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onAgeChanged below range', () {
      expect(_viewModel.currentAge, 25);

      _viewModel.onAgeChanged('0');

      expect(_viewModel.currentAge, 1);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onAgeChanged below range', () {
      expect(_viewModel.currentAge, 25);

      _viewModel.onAgeChanged('131');

      expect(_viewModel.currentAge, 130);
      expect(_viewModel.state is LoadedState, true);
    });
  });

  group('weight input', () {
    test('onWeightChanged in range', () {
      expect(_viewModel.currentWeight, 80);

      _viewModel.onWeightChanged('75');

      expect(_viewModel.currentWeight, 75);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onWeightChanged below range', () {
      expect(_viewModel.currentWeight, 80);

      _viewModel.onWeightChanged('9');

      expect(_viewModel.currentWeight, 10);
      expect(_viewModel.state is LoadedState, true);
    });
    test('onWeightChanged below range', () {
      expect(_viewModel.currentWeight, 80);

      _viewModel.onWeightChanged('901');

      expect(_viewModel.currentWeight, 900);
      expect(_viewModel.state is LoadedState, true);
    });
  });

  group('general', () {
    setUp(() {
      _viewModel.currentGender = Gender.female;
    });
    test('isValid is true', () {
      expect(_viewModel.isValid, true);
    });
    test('isValid is true', () {
      _viewModel.currentGender = null;

      expect(_viewModel.isValid, false);
    });
    test('onCalculate successful', () {
      when(_navigationService.pushNamed(any, arguments: anyNamed('arguments')))
          .thenAnswer((_) => Future.value());

      expect(_viewModel.isValid, true);

      _viewModel.onCalculate();

      UserEntry? _userEntry = verify(_navigationService.pushNamed(
              Routes.resultView,
              arguments: captureAnyNamed('arguments')))
          .captured
          .single;

      expect(_userEntry, isNotNull);
      expect(_userEntry is UserEntry, true);
      expect(_userEntry?.age, 25);
      expect(_userEntry?.gender, Gender.female);
      expect(_userEntry?.height, 170);
      expect(_userEntry?.weight, 80);
      expect(_userEntry?.bmi, 27.68);

      expect(_viewModel.state is LoadedState, true);
    });
    test('onCalculate unsuccessful', () {
      when(_navigationService.pushNamed(any, arguments: anyNamed('arguments')))
          .thenAnswer((_) => Future.value());

      expect(_viewModel.isValid, true);

      _viewModel.currentWeight = -200;

      expect(_viewModel.isValid, false);

      _viewModel.onCalculate();

      verifyNever(_navigationService.pushNamed(Routes.resultView,
          arguments: captureAnyNamed('arguments')));

      expect(_viewModel.state is ErrorState, true);
      expect((_viewModel.state as ErrorState).failure is EmptyFailure, true);
    });
  });
}
