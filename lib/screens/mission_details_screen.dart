import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../data/missionList.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../widgets/drivr_app_bar.dart';

class MissionDetailsScreen extends StatelessWidget {
  const MissionDetailsScreen({super.key, required this.currentMissionId});

  final int currentMissionId;

  @override
  Widget build(BuildContext context) {
    var missionContext = context.watch<MissionsList>();
    var currentMission = missionContext.getById(currentMissionId);

    void markAsAccomplished(){
      debugPrint('trying to mark ${currentMission.id} as accomplished');
      missionContext.accomplishMission(currentMission.id);
    }

    return Scaffold(
      appBar: DrivrAppBar(
          title: 'Mission ${currentMission.id}',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      body: Center( child:
              Column(
                children: [
                  Text('Mission ${currentMission.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Level: ${currentMission.level}'),
                  Text('Accomplished: ${currentMission.accomplished}'),
                  Text('Description: ${currentMission.description}'),
                  TextButton(onPressed: markAsAccomplished, child: const Text('Mark as accomplished'))
                ],
              )
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }


}