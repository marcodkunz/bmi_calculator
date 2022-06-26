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
}
