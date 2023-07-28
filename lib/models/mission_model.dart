import 'package:flutter/material.dart';
@immutable
class MissionModel{
  final int id;
  final String name;
  final int level;
  final bool accomplished;
  final Color color;

  MissionModel(this.id, this.name, this.level, this.accomplished) :
        color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is MissionModel && other.id == id;
}