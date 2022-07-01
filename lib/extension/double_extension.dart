import 'dart:math';

extension DoubleExtension on double? {
  double? roundDouble([int decimalPlaces = 2]) {
    if (this == null || decimalPlaces < 0) return null;
    var _factor = pow(10, decimalPlaces);
    return (this! * _factor).roundToDouble() / _factor;
  }
}
