import 'package:drivr/models/missionQuestion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/mission_storage.dart';
import '../../models/progress_model.dart';

class MissionQuestionItem extends StatelessWidget {
  const MissionQuestionItem(
      {super.key,
      required this.missionQuestion,
      required this.missionId,
      required this.currentUserId});

  final MissionQuestion missionQuestion;
  final int missionId;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    var progressContext = context.watch<ProgressModel>();

    List<Widget> alternatives = [];

    String status = "";

    void navigateToMissionDetailsPage() {
      context.go('/missions/$missionId');
    }

    void answerQuestionFalsely() {
      navigateToMissionDetailsPage();
    }

    void navigateToCorrectAnswerScreen() {
      context.go('/missions/questions/correct');
    }

    Future<void> answerQuestionCorrectly() async {
      await MissionStorage().postQuestionAnswer(
          missionId, missionQuestion.questionId, currentUserId, true, "");
      await progressContext.saveExperience(5, currentUserId);
      navigateToCorrectAnswerScreen();
    }

    for (var element in missionQuestion.alternatives) {
      void Function() answerMethod;
      answerMethod = element == missionQuestion.answer
          ? answerQuestionCorrectly
          : answerQuestionFalsely;

      alternatives.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child:
              ElevatedButton(onPressed: answerMethod, child: Text(element))));
    }

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Icon(
                  Icons.question_answer,
                  size: 64,
                  color: Colors.black12,
                )),
            Text(missionQuestion.question,
                style: const TextStyle(fontSize: 18)),
            const Text("Options:", style: TextStyle(fontSize: 12)),
            const VerticalDivider(),
            Column(
              children: alternatives,
            ),
            Text(status)
          ],
        ));
  }
}
