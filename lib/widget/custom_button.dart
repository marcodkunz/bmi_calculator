import 'package:flutter/material.dart';

import '../style/color_styles.dart';
import '../style/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const CustomButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onClick,
        child: Text(text, style: TextStyles.BodyMediumWhite),
        style: TextButton.styleFrom(
            backgroundColor: ColorStyles.petrol,
            minimumSize: const Size.fromHeight(50)));
  }
}
