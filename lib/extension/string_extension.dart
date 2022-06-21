import 'package:bmi_calculator/model/user_entry.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  Gender genderFromString() {
    if (isNullOrEmpty()) return Gender.unknown;
    switch (this) {
      case 'Gender.male':
        return Gender.male;
      case 'Gender.female':
        return Gender.female;
      default:
        return Gender.unknown;
    }
  }
}
