import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../data/missionList.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/missionListItem.dart';

class MissionsScreen extends StatelessWidget{
  const MissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var missionContext = context.watch<MissionsList>();

    if(missionContext.missions.isEmpty){
      missionContext.loadMissions();
    }

    var playerLevel = context.read<ProfileModel>().currentLevel;
    var numberOfMissions = missionContext.getNumberOfMissionsForCurrentPlayerLevel(playerLevel);

    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Missions',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
        body:CustomScrollView(
          slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 4)),
                  SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) => MissionListItem(index), childCount: numberOfMissions))
                ],),
        bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }
}
