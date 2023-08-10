import 'package:drivr/widgets/mission_list_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/progress_model.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../data/missionList.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_drawer_menu.dart';

class MissionsScreen extends StatefulWidget{
  const MissionsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MissionScreen();
}

class _MissionScreen extends State<MissionsScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var missionContext = context.watch<MissionsList>();

    if(missionContext.missions.isEmpty){
      missionContext.loadMissions();
    }

    var playerLevel = context.read<ProgressModel>().currentLevel;
    var numberOfMissions = missionContext.getNumberOfMissionsForCurrentPlayerLevel(playerLevel);

    Widget _listBuilder(BuildContext context, int index){
      if (index >= numberOfMissions) return Container();
      const color = Colors.lime;
      var mission = missionContext.missions[index];

      return SafeArea(
        top: false,
        bottom: false,
        child: Hero(
          tag: index,
          child: MissionListCard(
            name: mission.name,
            level: mission.level,
            description: mission.description,
            color: color,
            heroAnimation: const AlwaysStoppedAnimation(0),
            isAccomplished: mission.accomplished,
            onPressed: (){
              context.go('/missions/${mission.id}');
            },
          )
        )
      );
    }

    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Missions',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body:ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: numberOfMissions,
          itemBuilder: _listBuilder),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }
}
