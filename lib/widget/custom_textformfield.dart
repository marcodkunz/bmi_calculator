
import 'package:flutter/material.dart';
import '../style/color_styles.dart';
import '../style/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String suffix;
  final ValueChanged<String>? onChange;
  final int max;

  const CustomTextFormField({Key? key, required this.suffix, required this.onChange, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: ColorStyles.white,
        textAlign: TextAlign.center,
        style: TextStyles.TitleMediumWhite,
        textInputAction: TextInputAction.done,
        onChanged: onChange,
        decoration: InputDecoration(
            suffixText: suffix,
            counter: Offstage()),
        maxLength: max);
  }
}













