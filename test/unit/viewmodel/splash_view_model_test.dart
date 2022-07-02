import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock_implementations.mocks.dart';

void main() {
  late MockINavigationService _navigationService;
  late SplashViewModel _viewModel;

  setUp(() {
    _navigationService = MockINavigationService();
    _viewModel = SplashViewModel(_navigationService);
  });

  test('successful', () async {
    when(_navigationService.pushNamedAndRemoveUntil(any))
        .thenAnswer((_) => Future.value());

    await _viewModel.init();

    expect(_viewModel.state is LoadedState, true);
    verify(_navigationService.pushNamedAndRemoveUntil(Routes.homeView));
  });
}
