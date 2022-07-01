import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/viewmodel/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock_implementations.mocks.dart';

void main() {
  late MockINavigationService _navigationService;
  late HomeViewModel _viewModel;

  setUp(() {
    _navigationService = MockINavigationService();
    _viewModel = HomeViewModel(_navigationService);
  });

  test('onInfoPressed()', () async {
    await _viewModel.onInfoPressed();
    verify(_navigationService.pushNamed(Routes.infoView));
  });

  test('onHistoryPressed()', () async {
    await _viewModel.onInfoPressed();
    verify(_navigationService.pushNamed(Routes.historyView));
  });

  test('onInputPressed()', () async {
    await _viewModel.onInfoPressed();
    verify(_navigationService.pushNamed(Routes.inputView));
  });
}
