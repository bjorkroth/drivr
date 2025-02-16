import 'package:drivr/widgets/mission_question_item.dart';
import 'package:flutter/material.dart';

import '../data/mission_storage.dart';
import '../models/mission_model.dart';
import '../widgets/loading_progress_indicator.dart';

class MissionQuestionScreen extends StatelessWidget {
  final int currentMissionId;
  final int currentQuestionId;
  final String currentUserId;

  const MissionQuestionScreen(
      {super.key,
      required this.currentMissionId,
      required this.currentQuestionId,
      required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return MissionQuestionContainer(
        currentMissionId: currentMissionId,
        currentQuestionId: currentQuestionId,
        currentUserId: currentUserId);
  }
}

class MissionQuestionContainer extends StatefulWidget {
  final int currentMissionId;
  final String currentUserId;
  final int currentQuestionId;
  const MissionQuestionContainer(
      {super.key,
      required this.currentMissionId,
      required this.currentQuestionId,
      required this.currentUserId});

  @override
  State<StatefulWidget> createState() => _MissionQuestionState();
}

class _MissionQuestionState extends State<MissionQuestionContainer> {
  late Future<MissionModel> currentMissionFuture;
  late int questionId;
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    currentMissionFuture = MissionStorage()
        .getMissionById(widget.currentMissionId, widget.currentUserId);
    questionId = widget.currentQuestionId;
    currentUserId = widget.currentUserId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentMissionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentMission = snapshot.data;
            if (currentMission == null) return Container();

            var questions = currentMission!.questions;

            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: currentMission.questions.length,
                itemBuilder: (context, index) {
                  return MissionQuestionItem(
                    missionQuestion: questions[index],
                    missionId: currentMission.id,
                    currentUserId: currentUserId,
                  );
                });
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading Questions");
          }
        });
  }
}
