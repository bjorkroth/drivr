import 'package:flutter/material.dart';

class NoUserFound extends StatelessWidget {
  const NoUserFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Invalid credentials",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.none))),
    ]);
  }
}
