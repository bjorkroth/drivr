import 'package:drivr/extenders/mission_list_item_extenders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/missionList.dart';
import '../models/mission_model.dart';
import '../models/profile_model.dart';

class MissionListItem extends StatelessWidget{
  final int index;

  const MissionListItem(this.index, {super.key});

  @override
  Widget build(BuildContext context){
    var playerLevel = context.read<ProfileModel>().currentLevel;

    var item = context.select<MissionsList, MissionModel>(
        (missions) => missions.getByPosition(index),
    );

    var action = MissionListItemExtenders().getActionButton(item, context, playerLevel);
    var titleTextStyle = MissionListItemExtenders().getListItemTextStyle(item, context, playerLevel);

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
                child: Center(child: Text(item.level.toString())),
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