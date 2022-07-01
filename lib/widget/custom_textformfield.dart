import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/style/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String suffix;
  final ValueChanged<String>? onChange;
  final int max;
  final FocusNode? focusNode;

  const CustomTextFormField(
      {Key? key,
      required this.suffix,
      required this.onChange,
      required this.max,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        cursorColor: ColorStyles.white,
        textAlign: TextAlign.center,
        style: TextStyles.TitleMediumWhite,
        textInputAction: TextInputAction.done,
        onChanged: onChange,
        decoration: InputDecoration(suffixText: suffix, counter: Offstage()),
        maxLength: max);
  }
}
