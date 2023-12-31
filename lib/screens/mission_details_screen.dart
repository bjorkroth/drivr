import 'package:drivr/widgets/mission_detail_icon_row_item.dart';
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

    void navigateToMissionPage() {
      context.go('/missions');
    }

    void markAsAccomplished() async {
      missionContext.accomplishMission(currentMission.id);
      await missionContext.accomplishMissionAsync(currentMission.id);
      await progressContext.saveExperience(currentMission.experienceEarned);

      navigateToMissionPage();
    }

    var accomplishButton = TextButton(
        onPressed: markAsAccomplished,
        child: const Text('Mark as accomplished'));
    var accomplishRowButton = ElevatedButton(
        onPressed: markAsAccomplished,
        child: const MissionDetailIconRowItem(text: " Accomplish", icon: Icons.add, textColor: Colors.black)
    );
    var alreadyDoneText = const Text('Mission is already accomplished', style: TextStyle(fontStyle: FontStyle.italic),);
    var doneIconRow = const MissionDetailIconRowItem(text: " Done", icon: Icons.done, textColor: Colors.white);
    Widget actionButton;
    Widget doneOrActionRowButton;

    if (currentMission.accomplished) {
      actionButton = alreadyDoneText;
      doneOrActionRowButton = doneIconRow;
    } else {
      actionButton = accomplishButton;
      doneOrActionRowButton = accomplishRowButton;
    }

    return Scaffold(
      appBar: DrivrAppBar(
          title: 'Mission ${currentMission.id}',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            color: Colors.amber,
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), child:
                Text('Mission ${currentMission.name}',
                    style: const TextStyle(fontSize: 26, color: Colors.white)),
                    )
                ],
            )
          ),
          Container(
            height: 70,
            color: Colors.blueGrey,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MissionDetailIconRowItem(text: 'Level ${currentMission.level}', icon: Icons.format_list_numbered_rounded, textColor: Colors.white,),
                MissionDetailIconRowItem(text: '${currentMission.experienceEarned} XP', icon: Icons.grade, textColor: Colors.white,),
                doneOrActionRowButton
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Description:'),
                Text(currentMission.description),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: actionButton,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }
}
