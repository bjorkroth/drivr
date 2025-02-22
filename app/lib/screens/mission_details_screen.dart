import 'package:drivr/data/mission_storage.dart';
import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/loading_progress_indicator.dart';
import 'package:drivr/widgets/missionDetails/mission_details_menu_pills.dart';
import 'package:drivr/widgets/missionDetails/mission_detail_icon_row_item.dart';
import 'package:flutter/material.dart';

import '../models/mission_model.dart';
import '../widgets/missionDetails/mission_not_found.dart';

class MissionDetailsScreen extends StatelessWidget {
  final int currentMissionId;
  final String currentUserId;

  const MissionDetailsScreen(
      {super.key, required this.currentMissionId, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return MissionDetailsContainer(
        currentMissionId: currentMissionId, currentUserId: currentUserId);
  }
}

class MissionDetailsContainer extends StatefulWidget {
  final int currentMissionId;
  final String currentUserId;
  const MissionDetailsContainer(
      {super.key, required this.currentMissionId, required this.currentUserId});

  @override
  State<StatefulWidget> createState() => _MissionDetailsState();
}

class _MissionDetailsState extends State<MissionDetailsContainer> {
  late Future<MissionModel> currentMissionFuture;

  @override
  void initState() {
    super.initState();
    currentMissionFuture = MissionStorage()
        .getMissionById(widget.currentMissionId, widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;

            if (currentMission == null) return const MissionNotFound();

            return DrivrAppLayout(
                title: 'Mission ${currentMission.id}',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 200,
                        color: Colors.amber,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Text('Mission ${currentMission.name}',
                                  style: const TextStyle(
                                      fontSize: 26, color: Colors.white)),
                            )
                          ],
                        )),
                    Container(
                      height: 70,
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MissionDetailIconRowItem(
                            text: 'Level ${currentMission.level}',
                            icon: Icons.format_list_numbered_rounded,
                            textColor: Colors.white,
                          ),
                          MissionDetailIconRowItem(
                            text: '${currentMission.experienceEarned} XP',
                            icon: Icons.grade,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(currentMission.description),
                    ),
                    MissionDetailsMenuPills(currentMission: currentMission),
                  ],
                ));
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading Mission Details");
          }
        });
  }
}
