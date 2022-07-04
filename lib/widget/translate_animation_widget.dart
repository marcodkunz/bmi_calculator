import 'package:flutter/material.dart';

class TranslateAnimationWidget extends StatefulWidget {
  final Widget child;
  final AxisDirection direction;
  final double distance;
  final Duration? duration;

  const TranslateAnimationWidget(
      {Key? key,
      required this.child,
      required this.direction,
      this.distance = 30,
      this.duration = const Duration(milliseconds: 500)})
      : super(key: key);

  _TranslateAnimationWidgetState createState() =>
      _TranslateAnimationWidgetState();
}

class _TranslateAnimationWidgetState extends State<TranslateAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: widget.duration, lowerBound: -1, upperBound: 0);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: widget.child,
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: _offset,
            child: child,
          );
        });
  }

  Offset get _offset {
    switch (widget.direction) {
      case AxisDirection.up:
        return Offset(0, _controller.value * -widget.distance);
      case AxisDirection.down:
        return Offset(0, _controller.value * widget.distance);
      case AxisDirection.right:
        return Offset(_controller.value * widget.distance, 0);
      case AxisDirection.left:
        return Offset(_controller.value * -widget.distance, 0);
    }
  }
}
