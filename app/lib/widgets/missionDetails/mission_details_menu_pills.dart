import 'package:go_router/go_router.dart';
import 'package:drivr/models/mission_model.dart';
import 'package:flutter/material.dart';

import 'mission_detail_icon_row_item.dart';

class MissionDetailsMenuPills extends StatelessWidget {
  final MissionModel currentMission;

  const MissionDetailsMenuPills({super.key, required this.currentMission});

  @override
  Widget build(BuildContext context) {
    void navigateToExercisesPage() {
      var missionId = currentMission.id;
      context.go('/missions/$missionId/exercises');
    }

    void navigateToMissionQuestionsPage() {
      var missionId = currentMission.id;
      context.go('/missions/$missionId/questions');
    }

    void navigateToMissionReadMorePage() {
      var missionId = currentMission.id;
      context.go('/missions/$missionId/readMore');
    }

    return Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          ElevatedButton(
              onPressed: navigateToExercisesPage,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              child: const MissionDetailIconRowItem(
                  text: " Exercises",
                  icon: Icons.directions_car,
                  textColor: Colors.white)),
          ElevatedButton(
              onPressed: navigateToMissionQuestionsPage,
              child: const MissionDetailIconRowItem(
                  text: " Quiz",
                  icon: Icons.question_answer,
                  textColor: Colors.black)),
          ElevatedButton(
              onPressed: navigateToMissionReadMorePage,
              child: const MissionDetailIconRowItem(
                  text: " Read more",
                  icon: Icons.list,
                  textColor: Colors.black)),
        ]));
  }
}
