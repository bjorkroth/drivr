import 'package:flutter/material.dart';

import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../widgets/drivr_app_layout.dart';
import '../widgets/loading_progress_indicator.dart';
import '../widgets/missionExercise/mission_all_exercises_done.dart';
import '../widgets/missionExercise/mission_exercise_list.dart';

class MissionExerciseListScreen extends StatelessWidget {
  final int currentMissionId;
  final String currentUserId;

  const MissionExerciseListScreen(
      {super.key,
        required this.currentMissionId,
        required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return MissionExerciseListContainer(
        currentMissionId: currentMissionId,
        currentUserId: currentUserId);
  }
}

class MissionExerciseListContainer extends StatefulWidget {
  final int currentMissionId;
  final String currentUserId;
  const MissionExerciseListContainer(
      {super.key,
        required this.currentMissionId,
        required this.currentUserId});

  @override
  State<StatefulWidget> createState() => _MissionExerciseListState();
}

class _MissionExerciseListState extends State<MissionExerciseListContainer> {
  late Future<MissionModel> currentMissionFuture;
  late int questionId;
  late String currentUserId;
  late int currentMissionId;

  @override
  void initState() {
    super.initState();
    currentMissionFuture = MissionStorage()
        .getMissionById(widget.currentMissionId, widget.currentUserId);
    currentUserId = widget.currentUserId;
    currentMissionId = widget.currentMissionId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;
            if (currentMission == null) return Container();

            var exercises = currentMission.exercises.where((element) => element.isDone != true || element.canBeDoneMultipleTimes);

            if(exercises.isEmpty){
              return MissionAllExercisesDone(title: 'Mission $currentMissionId');
            }

            return DrivrAppLayout(
                title: 'Mission exercises',
                child: Center(
                    child: MissionExerciseList(
                      missionExercises: exercises.toList(),
                      missionId: currentMission.id,
                    )));
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading Exercise");
          }
        });
  }
}
