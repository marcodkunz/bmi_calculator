import 'package:bmi_calculator/service/database_service.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/viewmodel/history_view_model.dart';
import 'package:bmi_calculator/viewmodel/splash_view_model.dart';
import 'package:mockito/annotations.dart';

import 'mock_implementations.mocks.dart';

@GenerateMocks([
  IDatabaseService,
  INavigationService,
  SplashViewModel,
  HistoryViewModel,
])
class Mocks {
  MockIDatabaseService get IDatabaseService => MockIDatabaseService();
  MockINavigationService get INavigationService => MockINavigationService();
  MockSplashViewModel get SplashViewModel => MockSplashViewModel();
  MockHistoryViewModel get HistoryViewModel => MockHistoryViewModel();
}