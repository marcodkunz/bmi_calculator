import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle mediumBlack = TextStyle(color: ColorStyles.black, letterSpacing: 0.0, fontWeight: FontWeight.w500);
  static const TextStyle mediumWhite = TextStyle(color: ColorStyles.white, letterSpacing: 0.0, fontWeight: FontWeight.w500);

  static final TextStyle BodyMediumBlack = TextStyle(height: 1.5, fontSize: 16).merge(mediumBlack);
  static final TextStyle BodyMediumWhite = TextStyle(height: 1.5, fontSize: 16).merge(mediumWhite);
}