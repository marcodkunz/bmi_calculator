import 'package:bmi_calculator/service/database_service.dart';
import 'package:mockito/annotations.dart';

import 'mock_implementations.mocks.dart';

@GenerateMocks([
  IDatabaseService,
])
class Mocks {
  MockIDatabaseService get IDatabaseService => MockIDatabaseService();
}