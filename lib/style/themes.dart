import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorStyles.lightPetrol,
    backgroundColor: ColorStyles.darkPetrol,
    scaffoldBackgroundColor: ColorStyles.darkPetrol,
    appBarTheme: AppBarTheme(backgroundColor: ColorStyles.darkPetrol),
  );
}
