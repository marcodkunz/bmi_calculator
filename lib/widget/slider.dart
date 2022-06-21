import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderHeight extends StatefulWidget {
  const SliderHeight({Key? key}) : super(key: key);

  @override
  State<SliderHeight> createState() => _SliderHeightState();
}

class _SliderHeightState extends State<SliderHeight> {
  double _currentSliderValue = 170;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 230,
      divisions: 230,
      activeColor: ColorStyles.white,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
