import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MissionNotFound extends StatelessWidget {
  const MissionNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMissionPage() {
      context.go('/missions');
    }
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Icon(
                  Icons.info_outline,
                  size: 64,
                  color: Colors.black12,
                )),
            const Text("Mission was not found",
                style: TextStyle(fontSize: 18)),
            ElevatedButton(
                onPressed: navigateToMissionPage,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, foregroundColor: Colors.white),
                child: const Text("Go to missions list")),
          ],
        ));
  }
}