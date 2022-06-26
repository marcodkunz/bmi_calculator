import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class InputViewModel extends ViewModelBase {
  final INavigationService _navigationService;

  InputViewModel(this._navigationService);

  double currentHeight = 170;
  Gender? currentGender;

  get colorFemaleCard => currentGender == Gender.female
      ? ColorStyles.lightPetrol
      : ColorStyles.petrol;

  get colorMaleCard => currentGender == Gender.male
      ? ColorStyles.lightPetrol
      : ColorStyles.petrol;

  Future<void> onSubmit() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void onHeightChanged(double value) {
    currentHeight = value.roundToDouble();
    setViewState(LoadedState());
  }

  Future<void> onInfoPressed() async {
    await _navigationService.pushNamed(Routes.infoView);
  }

  Future<void> onHistoryPressed() async {
    await _navigationService.pushNamed(Routes.historyView);
  }

  void onFemaleSelected() {
    currentGender = Gender.female;
    setViewState(LoadedState());
  }

  void onMaleSelected() {
    currentGender = Gender.male;
    setViewState(LoadedState());
  }
}
