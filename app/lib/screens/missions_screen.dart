import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/loading_progress_indicator.dart';
import 'package:drivr/widgets/mission_list_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../models/progress_model.dart';

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
    var playerLevel = context.read<ProgressModel>().currentLevel;

    return DrivrAppLayout(
      title: 'Missions',
      child: FutureBuilder(
        future: _missions,
        builder: (context, snapshot) {
          var missionsList = snapshot.data;
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: missionsList == null ? 0 : missionsList.length,
                itemBuilder: (context, index) {
                  if (missionsList == null) return Container();
                  const color = Colors.lime;
                  var mission = missionsList[index];

                  if(mission.level > playerLevel) return Container();

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
            return const LoadingProgressIndicator(
                loadingText: "Loading missions");
          }
        },
      ),
    );
  }
}
