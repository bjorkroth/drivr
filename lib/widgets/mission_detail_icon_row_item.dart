import 'package:flutter/material.dart';

class MissionDetailIconRowItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;

  const MissionDetailIconRowItem(
      {super.key, required this.text,
  required this.icon, required this.textColor});

  @override
  Widget build(BuildContext context) {
    var missionDetailRowTextStyle = TextStyle(color: textColor, fontSize: 14);

    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: textColor,
        ),
        Text(
          text,
          style: missionDetailRowTextStyle,
        ),
      ],
    );
  }
}
