import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/database_service.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel extends ViewModelBase {
  final IDatabaseService _databaseService;
  final ILogger _logger;

  HistoryViewModel(this._databaseService, this._logger);

  List<UserEntry> _userEntries = <UserEntry>[];

  List<UserEntry> get userEntries => _userEntries;

  Future<void> init() async {
    await setViewState(LoadingState());
    _logger.d("HistoryViewModel", "Loading entries...");
    _userEntries = await _databaseService.getAllUserEntries();
    if (_userEntries.isEmpty) {
      await setViewState(EmptyState());
    } else {
      _logger.d("HistoryViewModel", "Loaded ${_userEntries.length} entries");
      await setViewState(LoadedState());
    }
  }

  Future<void> onDelete(int? id) async {
    if (id == null || id <= 0) return;
    _logger.i("HistoryViewModel", "Removing UserEntry with id=$id");
    var _count = await _databaseService.removeUserEntry(id);
    if (_count <= 0) {
      _logger.e("HistoryViewModel", "Removing UserEntry failed");
      await setViewState(ErrorState(EmptyFailure()));
    } else {
      _logger.d("HistoryViewModel", "Removed $_count UserEntries");
      _userEntries = await _databaseService.getAllUserEntries();
      await setViewState(LoadedState());
    }
  }
}
