import 'package:drivr/models/profile_model.dart';
import '../data/missionList.dart';
import '../models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MissionListItem extends StatelessWidget{
  final int index;

  const MissionListItem(this.index, {super.key});

  @override
  Widget build(BuildContext context){
    var playerLevel = context.read<ProfileModel>().currentLevel;

    var item = context.select<MissionsList, MissionModel>(
        (missions) => missions.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;
    var actionButtonTextAvailable = const Text('Do it');
    var actionButton = TextButton(
      onPressed: () {  },
      child: actionButtonTextAvailable);
    var unAvailableButtonStyle = const TextStyle(color: Colors.grey);
    var unAvailableStyle = const TextStyle(color: Colors.grey, fontSize: 20);
    var actionButtonTextNotAvailable = Text('Not available', style: unAvailableButtonStyle);

    late Widget action;
    late TextStyle titleTextStyle;
    if(playerLevel >= item.level){
      action = actionButton;
      titleTextStyle = textTheme ?? unAvailableStyle;
    } else{
      action = actionButtonTextNotAvailable;
      titleTextStyle = unAvailableStyle;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 50,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
                child: Text('Level ${item.level.toString()}'),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(child:
                Text(
                  item.name, style: titleTextStyle,
                ),
            ),
          const SizedBox(width: 24),
            action
          ],
        ),
      ),
    );
  }
}