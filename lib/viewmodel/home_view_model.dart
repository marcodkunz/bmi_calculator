import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ViewModelBase {
  final INavigationService _navigationService;

  HomeViewModel(this._navigationService);

  Future<void> onInfoPressed() async {
    await _navigationService.pushNamed(Routes.infoView);
  }

  Future<void> onHistoryPressed() async {
    await _navigationService.pushNamed(Routes.historyView);
  }

  Future<void> onInputPressed() async {
    await _navigationService.pushNamed(Routes.inputView);
  }
}
