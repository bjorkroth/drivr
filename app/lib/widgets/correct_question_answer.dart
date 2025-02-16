import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CorrectQuestionAnswer extends StatelessWidget {
  const CorrectQuestionAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMissionsPage() {
      context.go('/missions');
    }

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text("PERFECT!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.none))),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Icon(
            Icons.check_circle,
            size: 32,
            color: Colors.green,
          )),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text("Correct answer",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.none))),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: navigateToMissionsPage,
              child: const Text("Continue")),
        ),
      ),
    ]);
  }
}
