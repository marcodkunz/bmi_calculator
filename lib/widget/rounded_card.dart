import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final double height;
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;

  const RoundedCard({
    Key? key,
    required this.height,
    required this.child,
    this.color = ColorStyles.petrol,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: Card(
        color: color,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(4),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
