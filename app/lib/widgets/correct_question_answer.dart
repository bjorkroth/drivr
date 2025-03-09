import 'package:drivr/extenders/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CorrectQuestionAnswer extends StatelessWidget {
  final int xpEarned;

  const CorrectQuestionAnswer({super.key, required this.xpEarned});

  @override
  Widget build(BuildContext context) {
    void navigateToMissionsPage() {
      context.go('/missions');
    }

    var boxTextStyle = const TextStyle(fontSize: 14, color: Colors.black);
    var boxTextStyleBold = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);
    var backgroundColor = HexColor.fromHex("#E5EAF5");

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: backgroundColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Good job! Keep it up!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      decoration: TextDecoration.none))),
          Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              margin: EdgeInsets.symmetric(horizontal: 75),
              child: Icon(
                Icons.rocket_launch,
                size: 124,
                color: HexColor.fromHex("#4A5BB9"),
              )),
          Material(
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white54),
                    child: Column(
                      children: [
                        Text(
                          xpEarned.toString(),
                          style: boxTextStyleBold,
                        ),
                        Text(
                          "XP earned",
                          style: boxTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white54),
                    child: Column(
                      children: [
                        Icon(
                          Icons.electric_bolt,
                          size: 24,
                          color: HexColor.fromHex("#BF6A02"),
                        ),
                        Center(
                          child: Text(
                            "On a roll!",
                            style: boxTextStyle,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 12),
                child:
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor.fromHex("#4A5BB9"),
                          foregroundColor: Colors.white),
                      onPressed: navigateToMissionsPage,
                      child: const Text("Continue",
                          style: TextStyle(
                            fontSize: 18,
                          ))),
                ),
              ),
          ))
        ]));
  }
}
