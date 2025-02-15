import 'package:drivr/widgets/loading_progress_indicator.dart';
import 'package:drivr/widgets/mission_list_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../models/progress_model.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../data/missionList.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_drawer_menu.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MissionScreen();
}

class _MissionScreen extends State<MissionsScreen> {
  final Future<List<MissionModel>> _missions = MissionStorage().readMissions();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var missionContext = context.watch<MissionsList>();

    if (missionContext.missions.isEmpty) {
      missionContext.loadMissions();
    }

    var playerLevel = context.read<ProgressModel>().currentLevel;
    var numberOfMissions =
        missionContext.getNumberOfMissionsForCurrentPlayerLevel(playerLevel);

    return Scaffold(
      appBar: DrivrAppBar(
          title: 'Missions',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: FutureBuilder(
        future: _missions,
        builder: (context, snapshot) {
          var values = snapshot.data;
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: values == null ? 0 : values.length,
                itemBuilder: (context, index) {
                  if (values == null) return Container();
                  if (index >= numberOfMissions) return Container();
                  const color = Colors.lime;
                  var mission = values[index];

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
                            onPressed: () {
                              context.go('/missions/${mission.id}');
                            },
                          )));
                });
          } else {
            return const LoadingProgressIndicator(loadingText: "Loading missions");
          }
        },
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }
}
