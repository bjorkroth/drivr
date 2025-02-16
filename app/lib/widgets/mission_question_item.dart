import 'package:drivr/models/missionQuestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/mission_storage.dart';
import '../models/progress_model.dart';

class MissionQuestionItem extends StatelessWidget {
  const MissionQuestionItem(
      {super.key, required this.missionQuestion, required this.missionId, required this.currentUserId});

  final MissionQuestion missionQuestion;
  final int missionId;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    var progressContext = context.watch<ProgressModel>();

    List<ElevatedButton> alternatives = [];

    String status = "";

    void navigateToMissionDetailsPage() {
      context.go('/missions/$missionId');
    }

    void answerQuestionFalsely() {
      navigateToMissionDetailsPage();
    }

    Future<void> answerQuestionCorrectly() async {
      await MissionStorage().postQuestionAnswer(
          missionId, missionQuestion.questionId, currentUserId, true, "");
      await progressContext.saveExperience(5);
      navigateToMissionDetailsPage();
    }

    for (var element in missionQuestion.alternatives) {
      void Function() answerMethod;
      answerMethod = element == missionQuestion.answer
          ? answerQuestionCorrectly
          : answerQuestionFalsely;

      alternatives
          .add(ElevatedButton(onPressed: answerMethod, child: Text(element)));
    }

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(missionQuestion.question,
                style: const TextStyle(fontSize: 18)),
            const Text("Options:"),
            Column(
              children: alternatives,
            ),
            Text(status)
          ],
        ));
  }
}
