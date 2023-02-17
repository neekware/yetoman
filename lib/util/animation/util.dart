import 'package:flutter/material.dart';
import 'package:yetoman/util/animation/model.dart';

typedef RotationNotifier = ValueNotifier<RotationData>;

RotationNotifier rotationNotifier(int degree,
    {bool clockwise = true, double turns = 0.0}) {
  return ValueNotifier<RotationData>(RotationData.fromDegree(
      degree: degree, clockwise: clockwise, turns: turns));
}
