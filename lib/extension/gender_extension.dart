import 'package:bmi_calculator/model/user_entry.dart';
import 'package:flutter/material.dart';

extension GenderExtension on Gender? {
  IconData toIcon() {
    switch (this) {
      case Gender.male:
        return Icons.male;
      case Gender.female:
        return Icons.female;
      default:
        return Icons.transgender_sharp;
    }
  }
}