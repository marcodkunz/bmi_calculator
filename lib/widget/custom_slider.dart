import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double min;
  final double max;
  final double initial;
  final ValueChanged<double>? onChanged;

  const CustomSlider(
      {Key? key,
      required this.min,
      required this.max,
      required this.initial,
      this.onChanged})
      : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: widget.min,
      max: widget.max,
      divisions: widget.max.toInt(),
      activeColor: ColorStyles.white,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
