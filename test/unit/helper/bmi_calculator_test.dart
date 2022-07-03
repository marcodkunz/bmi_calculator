import 'package:bmi_calculator/helper/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('calculateBmi()', () {
    void calculateCheck(double? height, double? weight, double? expected) {
      test("$height $weight --> $expected", () {
        expect(BmiCalculator.calculateBmi(height, weight), equals(expected));
      });
    }

    calculateCheck(null, 65, null);
    calculateCheck(180, null, null);
    calculateCheck(180, -65, null);
    calculateCheck(180, 0, null);
    calculateCheck(-180, 65, null);
    calculateCheck(0, 65, null);
    calculateCheck(180, 65, 20.06);
    calculateCheck(180, 30, 9.26);
    calculateCheck(180, 150, 46.3);
    calculateCheck(20, 150, 3750);
  });
}
