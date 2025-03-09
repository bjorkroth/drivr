import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../widgets/drivr_app_layout.dart';
import '../widgets/loading_progress_indicator.dart';
import '../widgets/missionExercise/mission_all_exercises_done.dart';
import '../widgets/missionExercise/mission_exercise_item.dart';

class MissionExerciseScreen extends StatelessWidget {
  final int currentMissionId;
  final int currentExerciseId;
  final String currentUserId;

  const MissionExerciseScreen(
      {super.key,
      required this.currentMissionId,
      required this.currentUserId,
      required this.currentExerciseId});

  @override
  Widget build(BuildContext context) {
    return MissionQuestionContainer(
      currentMissionId: currentMissionId,
      currentUserId: currentUserId,
      currentExerciseId: currentExerciseId,
    );
  }
}

class MissionQuestionContainer extends StatefulWidget {
  final int currentMissionId;
  final int currentExerciseId;
  final String currentUserId;
  const MissionQuestionContainer(
      {super.key,
      required this.currentMissionId,
      required this.currentUserId,
      required this.currentExerciseId});

  @override
  State<StatefulWidget> createState() => _MissionQuestionState();
}

class _MissionQuestionState extends State<MissionQuestionContainer> {
  late Future<MissionModel> currentMissionFuture;
  late int questionId;
  late String currentUserId;
  late int currentMissionId;
  late int currentExerciseId;

  @override
  void initState() {
    super.initState();
    currentMissionFuture = MissionStorage()
        .getMissionById(widget.currentMissionId, widget.currentUserId);
    currentUserId = widget.currentUserId;
    currentMissionId = widget.currentMissionId;
    currentExerciseId = widget.currentExerciseId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;
            if (currentMission == null) return Container();

            var exercise = currentMission.exercises.firstWhereOrNull(
                (element) =>
                    element.exerciseId == currentExerciseId);

            //Check for not found
            if (exercise == null) {
              return LoadingProgressIndicator(
                  loadingText: 'Exercise not found');
            }

            if (exercise.isDone == true && !exercise.canBeDoneMultipleTimes) {
              return MissionAllExercisesDone(
                  title: 'Exercise $currentExerciseId');
            }

            return DrivrAppLayout(
                title: 'Exercise',
                child: Center(
                    child: MissionExerciseItem(
                  missionExercise: exercise,
                  missionId: currentMission.id,
                  currentUserId: currentUserId,
                )));
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading Exercise");
          }
        });
  }
}
