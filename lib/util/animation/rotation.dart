import 'package:flutter/material.dart';
import 'package:yetoman/util/animation/util.dart';

import 'model.dart';

class RotateIcon extends StatelessWidget {
  final Widget child;
  final RotationNotifier notifier;

  const RotateIcon({
    Key? key,
    required this.child,
    required this.notifier,
  }) : super(key: key);

  void _animate() {}

  @override
  Widget build(BuildContext context) {
    // _changeRotation();
    print('_turns: ${notifier.value.turns}');
    return AnimatedBuilder(
      animation: notifier,
      builder: (BuildContext context, Widget? child) {
        // _changeRotation();
        return AnimatedRotation(
          turns: notifier.value.turns,
          duration: const Duration(milliseconds: 200),
          child: child,
        );
      },
    );
  }
}
