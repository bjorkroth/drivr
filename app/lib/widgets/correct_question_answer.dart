import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CorrectQuestionAnswer extends StatelessWidget {
  const CorrectQuestionAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMissionsPage() {
      context.go('/missions');
    }

    return Container(
        color: Colors.lightGreen,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("PERFECT!",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 52,
                      decoration: TextDecoration.none))),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Icon(
                Icons.check_circle,
                size: 94,
                color: Colors.green,
              )),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text("Correct answer",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 36,
                      decoration: TextDecoration.none))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 30,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: navigateToMissionsPage,
                  child: const Text("CONTINUE",
                      style: TextStyle(
                        fontSize: 18,
                      ))),
            ),
          )
        ]));
  }
}
