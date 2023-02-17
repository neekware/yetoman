import 'package:flutter/material.dart';
import 'package:yetoman/util/constant.dart';

class RotateIcon extends StatefulWidget {
  final Widget child;
  final int degree;
  final RotationDirection rotation;

  const RotateIcon(
      {Key? key,
      required this.child,
      required this.degree,
      this.rotation = RotationDirection.backAndForth})
      : super(key: key);

  @override
  State<RotateIcon> createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() {
      if (widget.rotation == RotationDirection.backAndForth) {
        turns += widget.degree / 360;
        turns > 0 ? turns = turns * -1 : turns = turns * 1;
      } else if (widget.rotation == RotationDirection.clockwise) {
        turns += widget.degree / 360;
      } else if (widget.rotation == RotationDirection.counterClockwise) {
        turns -= widget.degree / 360;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _changeRotation();
    print('turns: $turns');
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(milliseconds: 200),
      child: widget.child,
    );
  }
}
