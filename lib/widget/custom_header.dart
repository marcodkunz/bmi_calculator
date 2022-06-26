import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorStyles.darkPetrol,
        title: Text("Body Mass Index"));
  }
}
