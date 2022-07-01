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
    await setViewState(LoadingState());
    await Future.delayed(Duration(seconds: 2));
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    await setViewState(LoadedState());
  }
}
