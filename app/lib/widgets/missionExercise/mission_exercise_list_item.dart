import 'package:drivr/models/mission_exercise.dart';
import 'package:flutter/material.dart';

import '../pressable_card.dart';

class MissionExerciseListItem extends StatelessWidget {
  final MissionExercise missionExercise;
  final Color color;
  final Animation<double> heroAnimation;
  final VoidCallback? onPressed;

  const MissionExerciseListItem(
      {super.key,
      required this.color,
      required this.heroAnimation,
      this.onPressed, required this.missionExercise});

  @override
  Widget build(BuildContext context) {
    return PressableCard(
        color: color,
        flattenAnimation: heroAnimation,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12), child: Text(missionExercise.title),)
        ));
  }
}
