import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/pressable_card.dart';
import '../extenders/mission_list_item_extenders.dart';
import '../models/progress_model.dart';

class MissionListCard extends StatelessWidget {
  final String name;
  final int level;
  final String description;
  final bool isAccomplished;
  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> heroAnimation;

  const MissionListCard(
      {super.key,
      required this.name,
      required this.level,
      required this.description,
      this.onPressed,
      required this.color,
      required this.heroAnimation,
      required this.isAccomplished});

  @override
  Widget build(BuildContext context) {
    var playerLevel = context.read<ProgressModel>().currentLevel;

    var titleTextStyle = MissionListItemExtenders()
        .getListItemTextStyle(isAccomplished, level, context, playerLevel);

    var doneText = Container();

    if(isAccomplished){
      doneText = Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(
              Icons.check_box,
              size: 15,
              color: Colors.green,
            ),
            Text('Done')
          ],)
      );
    }

    return PressableCard(
      color: color,
      flattenAnimation: heroAnimation,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    name,
                    style: titleTextStyle,
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Nivå $level -  $description',
                      softWrap: true,
                    )
                ),
                doneText
              ],
            )),
            Container(
              height: 90,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 16),
              child: const Icon(
                Icons.play_circle,
                size: 40,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
