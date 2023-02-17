import 'dart:math';

import 'package:flutter/material.dart';

class AnimateRotate extends StatefulWidget {
  final Widget child;
  final int duration;
  final ValueNotifier<int> rotationNotifier;

  const AnimateRotate(
      {Key? key,
      required this.child,
      required this.rotationNotifier,
      this.duration = 1000})
      : super(key: key);

  @override
  State<AnimateRotate> createState() => _AnimateRotateState();
}

class _AnimateRotateState extends State<AnimateRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // await _controller.reverse();
      }
    });

    setRotate(widget.rotationNotifier.value);
  }

  void setRotate(int degree) {
    final angle = degree * pi / 180;

    _animation = Tween<double>(
      begin: 0.0,
      end: angle,
    ).animate(_controller);
    if (degree > 0)
      _controller.forward();
    else
      _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.rotationNotifier,
      child: widget.child,
      builder: (context, child) {
        setRotate(widget.rotationNotifier.value);
        print('rotation: ${widget.rotationNotifier.value}');
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(
              _animation.value,
            ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
