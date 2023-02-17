import 'dart:math' as math;

import 'package:flutter/material.dart';

typedef PressedCallback = Function(bool pressed);

class AnimationWidget extends StatefulWidget {
  Widget child = Container();
  int degree = 90;
  bool forward = true;
  VoidCallback? onPressed;

  AnimationWidget(
      {super.key, required this.child, required this.degree, this.onPressed});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  _AnimationWidgetState();

  late final AnimationController widgetCtrl = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200))
    ..addListener(() {
      setState(() {});
    });

  final rotation = [90, 180, 270, 360, -90, -180, -270, -360];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
          animation: widgetCtrl,
          builder: (context, child) {
            widget.forward ? widgetCtrl.forward() : widgetCtrl.reverse();
            return RotationTransition(
              turns: Tween<double>(begin: 0.0, end: widget.degree / 360)
                  .animate(widgetCtrl),
              alignment: Alignment.center,
              child: widget.child,
            );
          }),
      onTapDown: (details) {
        setState(() {
          widget.forward = !widget.forward;
        });
        widget.onPressed?.call();
      },
    );
  }
}
