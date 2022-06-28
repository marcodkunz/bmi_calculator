import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends ViewModelBase {
  final INavigationService _navigationService;

  SplashViewModel(this._navigationService);

  @override
  Future init() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}
