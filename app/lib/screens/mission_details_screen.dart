import 'package:drivr/data/mission_storage.dart';
import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/loading_progress_indicator.dart';
import 'package:drivr/widgets/missionDetails/mission_details_menu_pills.dart';
import 'package:drivr/widgets/missionDetails/mission_detail_icon_row_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../auth/auth_provider.dart';
import '../data/missionList.dart';
import '../models/mission_model.dart';
import '../models/progress_model.dart';
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
    var progressContext = context.watch<ProgressModel>();
    var authProvider = context.watch<AuthProvider>();
    var missionContext = context.watch<MissionsList>();

    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;
            var currentUserId = authProvider.currentUser;

            if (currentMission == null) return const MissionNotFound();

            void navigateToMissionPage() {
              context.go('/missions');
            }

            void markAsAccomplished() async {
              missionContext.accomplishMission(currentMission.id);
              await missionContext.accomplishMissionAsync(
                  currentMission.id, currentUserId);
              await progressContext
                  .saveExperience(currentMission.experienceEarned,currentUserId);

              navigateToMissionPage();
            }

            var accomplishButton = TextButton(
                onPressed: markAsAccomplished,
                child: const Text('Mark as accomplished'));
            var accomplishRowButton = ElevatedButton(
                onPressed: markAsAccomplished,
                child: const MissionDetailIconRowItem(
                    text: " Accomplish",
                    icon: Icons.add,
                    textColor: Colors.black));
            var alreadyDoneText = const Text(
              'Mission is already accomplished',
              style: TextStyle(fontStyle: FontStyle.italic),
            );
            var doneIconRow = const MissionDetailIconRowItem(
                text: " Done", icon: Icons.done, textColor: Colors.white);
            Widget actionButton;
            Widget doneOrActionRowButton;

            if (currentMission.accomplished) {
              actionButton = alreadyDoneText;
              doneOrActionRowButton = doneIconRow;
            } else {
              actionButton = accomplishButton;
              doneOrActionRowButton = accomplishRowButton;
            }

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
