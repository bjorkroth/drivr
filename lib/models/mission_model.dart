import 'package:flutter/material.dart';
class MissionModel{
  final int id;
  final String name;
  final int level;
  late bool accomplished;
  final Color color;
  final String description;
  final double experienceEarned;

  MissionModel(this.id, this.name, this.level, this.accomplished, this.description, this.experienceEarned) :
        color = Colors.primaries[level % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is MissionModel && other.id == id;
}