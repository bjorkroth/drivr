import 'package:go_router/go_router.dart';

import '../models/mission_model.dart';
import 'package:flutter/material.dart';

class MissionListItemExtenders {
  TextStyle getListItemTextStyle(bool isAccomplished, int itemLevel, BuildContext context, int playerLevel) {
    var unAvailableStyle = const TextStyle(
        color: Colors.grey, fontSize: 20, fontStyle: FontStyle.italic);
    var accomplishedStyle = const TextStyle(
        color: Colors.grey, fontSize: 20, decoration: TextDecoration.lineThrough);
    var regularStyle = const TextStyle(color: Colors.black, fontSize: 20);

    if (itemLevel > playerLevel) {
      return unAvailableStyle;
    }

    if(isAccomplished){
      return accomplishedStyle;
    }

    return regularStyle;
  }

  Widget getActionButton (MissionModel item, BuildContext context, int playerLevel){
    var unAvailableButtonStyle = const TextStyle(color: Colors.grey);

    if(item.accomplished){
      return Text('Done!', style: unAvailableButtonStyle);
    }

    if(item.level > playerLevel){
      return Text('Not available', style: unAvailableButtonStyle);
    }

    return TextButton(
          onPressed: () {
            context.go('/missions/${item.id}');
          },
          child: const Text('Do it'));
  }
}
