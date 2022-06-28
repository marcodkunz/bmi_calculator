import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/database_service.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultViewModel extends ViewModelBase {
  final INavigationService _navigationService;
  final IDatabaseService _databaseService;
  final ILogger _logger;

  String? currentName;
  BmiRangeCategory? currentCategory;

  ResultViewModel(this._navigationService, this._databaseService, this._logger);

  UserEntry? _currentEntry;

  UserEntry? get currentEntry => _currentEntry;

  void onReady(UserEntry? _user) {
    _currentEntry = _user;
    if (_user == null) {
      _logger.e("ResultViewModel", "Received empty UserEntry");
      setViewState(ErrorState(EmptyFailure()));
    } else {
      _logger.d("ResultViewModel", "Loaded UserEntry-Object into ResultView");
      var _currentRange = bmiRange
          .where((element) =>
              element.startValue <= _currentEntry!.bmi &&
              element.endValue >= _currentEntry!.bmi)
          .first;
      currentCategory = _currentRange.category;
      _logger.d("ResultViewModel",
          "Got Category to BMI-Result: ${_currentEntry?.bmi}, Category: $currentCategory");
    }
  }

  Future<void> onSubmit() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void onNameChanged(String value) {
    currentName = value;
    _currentEntry?.name = currentName;
    setViewState(LoadedState());
  }

  void onSave() {
    _databaseService.insertUserEntry(_currentEntry!);
    _navigationService.pushNamedAndRemoveUntil(Routes.historyView);
  }
}
