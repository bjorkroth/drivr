
import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/mission_question_item.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../widgets/loading_progress_indicator.dart';

class MissionQuestionScreen extends StatelessWidget {
  final int currentMissionId;
  final String currentUserId;

  const MissionQuestionScreen(
      {super.key,
      required this.currentMissionId,
      required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return MissionQuestionContainer(
        currentMissionId: currentMissionId,
        currentUserId: currentUserId);
  }
}

class MissionQuestionContainer extends StatefulWidget {
  final int currentMissionId;
  final String currentUserId;
  const MissionQuestionContainer(
      {super.key,
      required this.currentMissionId,
      required this.currentUserId});

  @override
  State<StatefulWidget> createState() => _MissionQuestionState();
}

class _MissionQuestionState extends State<MissionQuestionContainer> {
  late Future<MissionModel> currentMissionFuture;
  late int questionId;
  late String currentUserId;
  late int currentMissionId;

  @override
  void initState() {
    super.initState();
    currentMissionFuture = MissionStorage()
        .getMissionById(widget.currentMissionId, widget.currentUserId);
    currentUserId = widget.currentUserId;
    currentMissionId = widget.currentMissionId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;
            if (currentMission == null) return Container();

           var question = currentMission.questions.firstWhereOrNull((element) => element.isAnswered != true);

           if(question == null){
             return DrivrAppLayout(title: 'Mission $currentMissionId',
                 child: const Text("All questions already answered for this mission"));
           }

            return DrivrAppLayout(
                title: 'Question ${question.questionId}',
                child: Center(
                    child: MissionQuestionItem(
                  missionQuestion: question,
                  missionId: currentMission.id,
                  currentUserId: currentUserId,
                )));
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading Questions");
          }
        });
  }
}
