import 'dart:math';

import 'package:flutter/material.dart';

class AnimateRotate extends StatelessWidget {
  final Widget child;
  final int duration;
  final ValueNotifier<int> rotationNotifier;

  const AnimateRotate(
      {Key? key,
      required this.child,
      required this.rotationNotifier,
      this.duration = 1000})
      : super(key: key);

  void setRotate(int degree) {
    final angle = degree * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotationNotifier,
      child: child,
      builder: (context, child) {
        setRotate(rotationNotifier.value);
        print('rotation: ${rotationNotifier.value}');
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(
              0.5,
            ),
          child: child,
        );
      },
    );
  }
}
