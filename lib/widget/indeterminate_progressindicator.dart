import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class IndeterminateProgressIndicator extends StatelessWidget {
  final Color color;

  const IndeterminateProgressIndicator(
      {Key? key, this.color = ColorStyles.lightPetrol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
