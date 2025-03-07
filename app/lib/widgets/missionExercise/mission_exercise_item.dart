import '../../data/mission_storage.dart';
import '../../models/mission_exercise.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/progress_model.dart';

class MissionExerciseItem extends StatelessWidget {
  const MissionExerciseItem(
      {super.key,
      required this.missionExercise,
      required this.missionId,
      required this.currentUserId});

  final MissionExercise missionExercise;
  final int missionId;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    var progressContext = context.watch<ProgressModel>();

    var xpEarned = !missionExercise.isDone
        ? missionExercise.experienceEarnedFirst
        : missionExercise.experienceEarnedRepeat;

    var canBeDoneMultipleTimes = missionExercise.canBeDoneMultipleTimes ? "Yes" : "No";

    String status = "";

    void navigateToMissionExercisesPage() {
      context.go('/missions/$missionId/exercises');
    }

    Future<void> completeExercise() async {
      await MissionStorage().postExerciseDone(
          missionId, missionExercise.exerciseId, currentUserId);
      await progressContext.saveExperience(xpEarned, currentUserId);
      navigateToMissionExercisesPage();
    }

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Icon(
                  Icons.directions_car,
                  size: 82,
                  color: Colors.black12,
                )),
            Text(missionExercise.title, style: const TextStyle(fontSize: 18)),
            Text("XP earned: $xpEarned", style: TextStyle(fontSize: 12)),
            Text("Can be done multiple times: $canBeDoneMultipleTimes", style: TextStyle(fontSize: 12)),
            const VerticalDivider(),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child:
                ElevatedButton(onPressed: completeExercise, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54, foregroundColor: Colors.white), child: Text("Complete exercise"),)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child:
                ElevatedButton(onPressed: navigateToMissionExercisesPage, child: Text("Cancel"))),
            Text(status)
          ],
        ));
  }
}
