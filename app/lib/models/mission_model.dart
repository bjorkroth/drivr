import 'package:flutter/material.dart';

import 'mission_question.dart';
class MissionModel{
  final int id;
  final String name;
  final int level;
  late bool accomplished;
  final Color color;
  final String description;
  final int experienceEarned;
  final bool canBeDoneMultipleTimes;
  final String type;
  final List<MissionQuestion> questions;

  MissionModel(
      this.id,
      this.name,
      this.level,
      this.accomplished,
      this.description,
      this.experienceEarned,
      this.canBeDoneMultipleTimes,
      this.type,
      this.questions) :
        color = Colors.primaries[level % Colors.primaries.length];

  factory MissionModel.fromJson(Map<String,dynamic> data){
    final int id = data['id'];
    final String name = data['name'];
    final int level = data['level'];
    late bool accomplished = data['accomplished'];
    final String description = data['description'];
    final int experienceEarned = data['experienceEarned'];
    final bool canBeDoneMultipleTimes = data['canBeDoneMultipleTimes'];
    final String type = data['type'];
    final List<dynamic> questionsData = data['questions'];
    List<MissionQuestion> questions = [];

    for (var element in questionsData) {
      var parsedQuestion = MissionQuestion.fromJson(element as Map<String,dynamic>);
      questions.add(parsedQuestion);
    }

    return MissionModel(id, name, level, accomplished, description, experienceEarned, canBeDoneMultipleTimes, type, questions);
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
    'canBeDoneMultipleTimes': canBeDoneMultipleTimes,
    'type': type,
    'questions': questions,
    };
  }
}