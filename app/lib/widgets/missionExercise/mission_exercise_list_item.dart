import 'package:drivr/extenders/HexColor.dart';
import 'package:drivr/models/mission_exercise.dart';
import 'package:flutter/material.dart';

import '../missionDetails/mission_detail_icon_row_item.dart';
import '../pressable_card.dart';

class MissionExerciseListItem extends StatelessWidget {
  final MissionExercise missionExercise;
  final Color color;
  final Animation<double> heroAnimation;
  final VoidCallback? onPressed;

  const MissionExerciseListItem(
      {super.key,
      required this.color,
      required this.heroAnimation,
      this.onPressed,
      required this.missionExercise});

  @override
  Widget build(BuildContext context) {
    var titleTextStyle = const TextStyle(color: Colors.black, fontSize: 16);
    var xpTextStyle = const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
    var xpUnitTextStyle = const TextStyle(color: Colors.grey, fontSize: 14);

    return Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            PressableCard(
              color: HexColor.fromHex("#8F98B3"),
              flattenAnimation: heroAnimation,
              onPressed: onPressed,
              child: Stack(children: [
                Container(
                  height: 150,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25,),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex("#D9D9D9")),
                    child: Icon(
                      Icons.directions_car,
                      size: 52,
                      color: HexColor.fromHex("#4A5BB9"),
                    ),
                  ),
                ),
              ]),
            ),
            Column(
              children: [],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      missionExercise.title,
                      style: titleTextStyle,
                    ),
                  ),
                  Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            "${missionExercise.experienceEarnedFirst} XP",
                            style: xpTextStyle,
                          ),
                          Text(
                            " / each",
                            style: xpUnitTextStyle,
                          ),
                        ],
                      ))
                ],
              )),
              Container(
                height: 60,
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: const MissionDetailIconRowItem(
                        text: " Start",
                        icon: Icons.play_arrow,
                        textColor: Colors.white)),
              )
            ])
          ],
        ));
  }
}
