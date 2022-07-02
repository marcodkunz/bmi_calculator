import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/result_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/default_user.dart';
import '../../helper/mock_implementations.mocks.dart';

void main() {
  late MockINavigationService _navigationService;
  late MockIDatabaseService _databaseService;
  late ResultViewModel _viewModel;

  setUp(() {
    _navigationService = MockINavigationService();
    _databaseService = MockIDatabaseService();
    _viewModel =
        ResultViewModel(_navigationService, _databaseService, NoLogger());
  });

  group('onReady()', () {
    test('successful', () {
      UserEntry _user = defaultUser();
      expect(_viewModel.currentEntry, null);

      _viewModel.onReady(_user);

      expect(_viewModel.currentEntry, _user);
      expect(_viewModel.currentCategory, BmiRangeCategory.overweight);
      expect(_viewModel.state is LoadedState, true);
    });
    test('unsuccessful', () {
      expect(_viewModel.currentEntry, null);

      _viewModel.onReady(null);

      expect(_viewModel.currentEntry, null);
      expect(_viewModel.currentCategory, null);
      expect(_viewModel.state is ErrorState, true);
      expect((_viewModel.state as ErrorState).failure is EmptyFailure, true);
    });
  });

  test('onNameChanged()', () {
    UserEntry _user = defaultUser();

    _viewModel.onReady(_user);
    _viewModel.onNameChanged('test');

    expect(_viewModel.currentEntry, isNotNull);
    expect(_viewModel.currentEntry?.name, isNotNull);
    expect(_viewModel.currentEntry?.name, 'test');
    expect(_viewModel.state is LoadedState, true);
  });

  group('onSave()', () {
    test('successful', () {
      when(_databaseService.insertUserEntry(any))
          .thenAnswer((_) => Future.value());
      when(_navigationService.pushNamedAndRemoveUntil(any))
          .thenAnswer((_) => Future.value());
      UserEntry _user = defaultUser();

      _viewModel.onReady(_user);
      _viewModel.onSave();

      expect(_viewModel.currentEntry, isNotNull);
      expect(_viewModel.state is LoadedState, true);

      verify(_databaseService.insertUserEntry(_user));
      verify(_navigationService.pushNamedAndRemoveUntil(Routes.historyView));
    });
    test('unsuccessful', () {
      when(_databaseService.insertUserEntry(any))
          .thenAnswer((_) => Future.value());
      when(_navigationService.pushNamedAndRemoveUntil(any))
          .thenAnswer((_) => Future.value());

      _viewModel.onSave();

      expect(_viewModel.currentEntry, null);
      expect(_viewModel.state is ErrorState, true);
      expect((_viewModel.state as ErrorState).failure is EmptyFailure, true);

      verifyNever(_databaseService.insertUserEntry(any));
      verifyNever(
          _navigationService.pushNamedAndRemoveUntil(Routes.historyView));
    });
  });
}
