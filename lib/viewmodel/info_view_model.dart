import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class InfoViewModel extends ViewModelBase {
  final INavigationService _navigationService;
  InfoViewModel(this._navigationService);

  Future<void> onSubmit() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  final List<Map> overview = [
  {'value': '<16.0', 'description' : 'Underweight (Severe thinness)'},
  {'value': '16.0 - 16.9', 'description' :  'Underweight (Moderate thinness)'},
  {'value': '17.0 - 18.4', 'description' :  'Underweight (Mild thinness)'},
  {'value':'18.5 - 24.9', 'description' : 'Normal range'},
  {'value': '15.0 - 29.9', 'description' : 'Overweight (Pre-obese)'},
  {'value': '30.0 - 34.9', 'description' :  'Obese (Class I)'},
  {'value': '35.0 - 39.9', 'description' : 'Obese (Class II)'},
  {'value': '>40.0', 'description' : 'Obese (Class III)'}
  ];
}
