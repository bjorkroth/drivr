import 'package:drivr/models/mission_exercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../models/progress_model.dart';
import 'mission_exercise_list_item.dart';

class MissionExerciseList extends StatelessWidget {
  final List<MissionExercise> missionExercises;
  final int missionId;

  const MissionExerciseList({super.key,
    required this.missionExercises, required this.missionId});

  @override
  Widget build(BuildContext context) {
    var playerLevel = context.read<ProgressModel>().currentLevel;

    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: missionExercises == null ? 0 : missionExercises.length,
        itemBuilder: (context, index) {
          if (missionExercises == null) return Container();
          const color = Colors.lime;
          var exercise = missionExercises[index];

          // if(exercise.level > playerLevel) return Container();

          return SafeArea(
              top: false,
              bottom: false,
              child: Hero(
                  tag: index,
                  child: MissionExerciseListItem(
                    missionExercise: exercise,
                    color: color,
                    heroAnimation: const AlwaysStoppedAnimation(0),
                    onPressed: () {
                      context.go('/missions/${missionId}/exercises/${exercise.exerciseId}');
                    },
                  )));
        });
  }



}