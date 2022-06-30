import 'package:bmi_calculator/extension/double_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('roundDouble', () {
    void roundCheck(double? double, int decimalPlaces, double? expected) {
      test("$double --> $expected", () {
        expect(double.roundDouble(decimalPlaces), equals(expected));
      });
    }

    roundCheck(null, 0, null);
    roundCheck(1, -1, null);
    roundCheck(1, 0, 1);
    roundCheck(1.234, 1, 1.2);
    roundCheck(1.234, 2, 1.23);
    roundCheck(1.234, 3, 1.234);
    roundCheck(1.234, 4, 1.234);
  });
}
