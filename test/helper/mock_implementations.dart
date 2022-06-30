import 'package:bmi_calculator/service/database_service.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:mockito/annotations.dart';

import 'mock_implementations.mocks.dart';

@GenerateMocks([
  IDatabaseService,
  INavigationService,
])
class Mocks {
  MockIDatabaseService get IDatabaseService => MockIDatabaseService();
  MockINavigationService get INavigationService => MockINavigationService();
}