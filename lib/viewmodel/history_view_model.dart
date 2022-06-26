import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/database_service.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel extends ViewModelBase {
  final INavigationService _navigationService;
  final IDatabaseService _databaseService;
  final ILogger _logger;

  HistoryViewModel(
      this._navigationService, this._databaseService, this._logger);

  List<UserEntry> _userEntries = <UserEntry>[];

  List<UserEntry> get userEntries => _userEntries;

  Future<void> init() async {
    await setViewState(LoadingState());
    _logger.d("HistoryViewModel", "Loading entries...");
    _userEntries = await _databaseService.getAllUserEntries();
    _logger.d("HistoryViewModel", "Loaded ${_userEntries.length} entries");
    await setViewState(LoadedState());
  }

  Future<void> onSubmit() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  Future<void> onDelete(int? id) async {
    if (id == null || id <= 0) return;
    // TODO implement delete
  }
}
