import 'package:bmi_calculator/extension/double_extension.dart';

class BmiCalculator {
  static double? calculateBmi(double? height, double? weight) {
    if (height == null || weight == null || height <= 0 || weight <= 0) {
      return null;
    }
    return (weight / ((height / 100) * (height / 100))).roundDouble();
  }
}
