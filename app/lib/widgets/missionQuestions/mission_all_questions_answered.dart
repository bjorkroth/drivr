import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../drivr_app_layout.dart';

class MissionAllQuestionsAnswered extends StatelessWidget {
  final String title;
  const MissionAllQuestionsAnswered({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    void navigateToMissionPage() {
      context.go('/missions');
    }

    return DrivrAppLayout(
        title: title,
        child: Center( child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Icon(
                      Icons.check_circle,
                      size: 64,
                      color: Colors.green,
                    )),
                const Text("All questions already answered for this mission",
                    style: TextStyle(fontSize: 18)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 20), child:
                ElevatedButton(
                    onPressed: navigateToMissionPage,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    child: const Text("Go to missions list"))),
              ],
            ))));
  }
}
