import 'package:flutter/material.dart';
class MissionModel{
  final int id;
  final String name;
  final int level;
  late bool accomplished;
  final Color color;
  final String description;
  final int experienceEarned;

  MissionModel(this.id, this.name, this.level, this.accomplished, this.description, this.experienceEarned) :
        color = Colors.primaries[level % Colors.primaries.length];

  factory MissionModel.fromJson(Map<String,dynamic> data){
    final int id = data['id'];
    final String name = data['name'];
    final int level = data['level'];
    late bool accomplished = data['accomplished'];
    final String description = data['description'];
    final int experienceEarned = data['experienceEarned'];

    return MissionModel(id, name, level, accomplished, description, experienceEarned);
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is MissionModel && other.id == id;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
    'id': id,
    'name': name,
    'level': level,
    'accomplished': accomplished,
    'description': description,
    'experienceEarned': experienceEarned,
    };
  }
}