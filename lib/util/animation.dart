import 'dart:math' as math;

import 'package:flutter/material.dart';

typedef PressedCallback = Function(bool pressed);

class AnimationWidget extends StatefulWidget {
  Widget child = Container();
  int degree = 90;

  AnimationWidget({super.key, required this.child, required this.degree});

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
    double end = widget.degree / 360 * 1.0;
    return GestureDetector(
      child: AnimatedBuilder(
          animation: widgetCtrl,
          builder: (context, child) {
            return RotationTransition(
              turns: Tween<double>(begin: 0.0, end: end).animate(widgetCtrl),
              alignment: Alignment.center,
              child: widget.child,
            );
          }),
      onTap: () {
        setState(() {
          end = widget.degree / 360;
          widgetCtrl.forward();
        });
        print('onTap');
      },
      // onTapUp: (details) {
      //   widgetCtrl.reverse();
      //   print('onTapUp');
      // },
    );
  }
}
