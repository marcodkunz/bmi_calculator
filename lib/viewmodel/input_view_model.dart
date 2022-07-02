import 'dart:math';

import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/extension/double_extension.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class InputViewModel extends ViewModelBase {
  final INavigationService _navigationService;
  final ILogger _logger;

  InputViewModel(this._navigationService, this._logger);

  double currentHeight = 170;
  Gender? currentGender;
  int currentAge = 25;
  int currentWeight = 80;

  Color get colorFemaleCard => currentGender == Gender.female
      ? ColorStyles.lightPetrol
      : ColorStyles.petrol;

  Color get colorMaleCard => currentGender == Gender.male
      ? ColorStyles.lightPetrol
      : ColorStyles.petrol;

  bool get isValid =>
      currentGender != null &&
      currentHeight >= 10 &&
      currentHeight <= 230 &&
      currentAge >= 1 &&
      currentAge <= 99 &&
      currentWeight >= 10 &&
      currentWeight <= 900;

  FocusNode _ageFocusNode = FocusNode();

  FocusNode get ageFocusNode => _ageFocusNode;

  FocusNode _weightFocusNode = FocusNode();

  FocusNode get weightFocusNode => _weightFocusNode;

  void onFemaleSelected() {
    currentGender = Gender.female;
    setViewState(LoadedState());
  }

  void onMaleSelected() {
    currentGender = Gender.male;
    setViewState(LoadedState());
  }

  void onHeightChanged(double value) {
    currentHeight = value.roundToDouble().clamp(10, 230);
    setViewState(LoadedState());
  }

  void onAgePressed() {
    if (_ageFocusNode.canRequestFocus) _ageFocusNode.requestFocus();
  }

  void onAgeChanged(String value) {
    currentAge = int.parse(value).clamp(1, 130);
    setViewState(LoadedState());
  }

  void onWeightPressed() {
    if (_weightFocusNode.canRequestFocus) _weightFocusNode.requestFocus();
  }

  void onWeightChanged(String value) {
    currentWeight = int.parse(value).clamp(10, 900);
    setViewState(LoadedState());
  }

  void onCalculate() {
    _ageFocusNode.unfocus();
    _weightFocusNode.unfocus();

    var bmi = (currentWeight / pow(currentHeight / 100, 2)).roundDouble();

    if (bmi == null || bmi <= 0) {
      setViewState(ErrorState(EmptyFailure()));
      _logger.e("InputViewModel", "Calculation went wrong");
    } else {
      _logger.d("InputViewModel",
          "Calculated bmi:  $bmi: weight: $currentWeight, height: $currentHeight");

      var userEntry = UserEntry(
          age: currentAge,
          gender: currentGender!,
          height: currentHeight.toInt(),
          weight: currentWeight.toInt(),
          bmi: bmi);

      _logger.d("InputViewModel", "New UserEntry-Object created");

      _navigationService.pushNamed(Routes.resultView, arguments: userEntry);
      setViewState(LoadedState());
    }
  }
}
