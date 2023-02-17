class RotationData {
  final int angle = 180;
  final bool clockwise = true;
  final double turns = 0.0;

  RotationData({angle, clockwise, turns});

  factory RotationData.fromDegree(
      {int? degree, bool? clockwise, double? turns}) {
    double newTurns = turns! + (degree! / 360);
    newTurns > 0 ? newTurns = newTurns * -1 : newTurns = newTurns * 1;
    print('newTurns: ${newTurns}');
    return RotationData(turns: newTurns, clockwise: clockwise, angle: degree);
  }
}
