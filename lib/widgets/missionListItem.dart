import '../data/missionList.dart';
import '../models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MissionListItem extends StatelessWidget{
  final int index;

  const MissionListItem(this.index, {super.key});

  @override
  Widget build(BuildContext context){
    var item = context.select<MissionsList, MissionModel>(
        (missions) => missions.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(child: Text(
              item.name, style: textTheme,
            )),
          const SizedBox(width: 24),
          TextButton(
            onPressed: () {  },
            child: const Text('Do it'),)
          ],
        ),
      ),
    );
  }
}