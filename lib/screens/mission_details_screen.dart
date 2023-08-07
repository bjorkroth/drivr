import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../data/missionList.dart';
import '../models/progress_model.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_drawer_menu.dart';


class MissionDetailsScreen extends StatelessWidget {
  const MissionDetailsScreen({super.key, required this.currentMissionId});

  final int currentMissionId;

  @override
  Widget build(BuildContext context) {
    var missionContext = context.watch<MissionsList>();
    var progressContext = context.watch<ProgressModel>();
    var currentMission = missionContext.getById(currentMissionId);

    void navigateToMissionPage(){
      context.go('/missions');
    }

    void markAsAccomplished() async{
      missionContext.accomplishMission(currentMission.id);
      await missionContext.accomplishMissionAsync(currentMission.id);
      await progressContext.saveExperience(currentMission.experienceEarned);

      navigateToMissionPage();
    }

    return Scaffold(
      appBar: DrivrAppBar(
          title: 'Mission ${currentMission.id}',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: Center( child:
              Column(
                children: [
                  Text('Mission ${currentMission.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Level: ${currentMission.level}'),
                  Text('Accomplished: ${currentMission.accomplished}'),
                  Text('Description: ${currentMission.description}'),
                  Text('XP earned: ${currentMission.experienceEarned} XP'),
                  TextButton(onPressed: markAsAccomplished, child: const Text('Mark as accomplished'))
                ],
              )
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }


}