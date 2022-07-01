import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/history_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock_implementations.mocks.dart';

void main() {
  late MockIDatabaseService _databaseService;
  late HistoryViewModel _viewModel;

  setUp(() {
    _databaseService = MockIDatabaseService();
    _viewModel = HistoryViewModel(_databaseService, NoLogger());
  });

  group('init()', () {
    test('successful', () async {
      var _result = UserEntry(
          height: 180, weight: 80, age: 30, gender: Gender.male, bmi: 24.7);
      when(_databaseService.getAllUserEntries())
          .thenAnswer((_) => Future.value([_result]));

      await _viewModel.init();

      expect(_viewModel.state is LoadedState, true);
      expect(_viewModel.userEntries.length, 1);
      expect(_viewModel.userEntries.first, _result);
    });

    test('empty List', () async {
      when(_databaseService.getAllUserEntries())
          .thenAnswer((_) => Future.value([]));

      await _viewModel.init();

      expect(_viewModel.state is EmptyState, true);
      expect(_viewModel.userEntries.length, 0);
    });
  });

  group('onDelete()', () {
    test('successful', () async {
      when(_databaseService.getAllUserEntries())
          .thenAnswer((_) => Future.value([]));
      when(_databaseService.removeUserEntry(any))
          .thenAnswer((_) => Future.value(1));

      await _viewModel.onDelete(1);

      expect(_viewModel.state is LoadedState, true);
      expect(_viewModel.userEntries.length, 0);
    });

    test('unsuccessful', () async {
      when(_databaseService.removeUserEntry(any))
          .thenAnswer((_) => Future.value(0));

      await _viewModel.onDelete(1);

      expect(_viewModel.state is ErrorState, true);
      expect((_viewModel.state as ErrorState).failure is EmptyFailure, true);
      expect(_viewModel.userEntries.length, 0);
    });
  });
}
