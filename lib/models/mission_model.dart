import 'package:flutter/widgets.dart';
@immutable
class MissionModel{
  final int id;
  final String name;
  final int level;
  final bool accomplished;

  const MissionModel(this.id, this.name, this.level, this.accomplished);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is MissionModel && other.id == id;
}