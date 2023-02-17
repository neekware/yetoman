import 'dart:math';

import 'package:flutter/material.dart';

class AnimateRotate extends StatefulWidget {
  final Widget child;
  final int degree;
  final int duration;
  final VoidCallback onPressed;

  const AnimateRotate(
      {Key? key,
      required this.child,
      required this.degree,
      required this.onPressed,
      this.duration = 2000})
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

    setRotate(widget.degree);
  }

  void setRotate(int degree) {
    final angle = degree * pi / 180;

    _animation = Tween<double>(
      begin: 0.0,
      end: angle,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
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
