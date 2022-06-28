import 'dart:ui';

import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
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
      currentAge <= 130 &&
      currentWeight >= 10 &&
      currentWeight <= 900;

  Future<void> onSubmit() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void onHeightChanged(double value) {
    currentHeight = value.roundToDouble();
    setViewState(LoadedState());
  }

  void onWeightChanged(String value) {
    var weight = int.parse(value).clamp(10, 900);
    currentWeight = weight;
    setViewState(LoadedState());
  }

  void onAgeChanged(String value) {
    var age = int.parse(value).clamp(1, 130);
    currentAge = age;
    setViewState(LoadedState());
  }

  void onFemaleSelected() {
    currentGender = Gender.female;
    setViewState(LoadedState());
  }

  void onMaleSelected() {
    currentGender = Gender.male;
    setViewState(LoadedState());
  }

  void onCalculate() {
    var bmi = double.parse(
        (currentWeight / ((currentHeight / 100) * (currentHeight / 100)))
            .toStringAsFixed(2));

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
  }
}
