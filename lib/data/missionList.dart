import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/mission_model.dart';

class MissionsList extends ChangeNotifier {
  List<MissionModel> missions = [];

  Future<void> loadMissions() async {
    final response = await rootBundle.loadString('assets/missions.json');
    List<dynamic> data = await json.decode(response);
    
    for (var element in data) {
      missions.add(MissionModel.fromJson(element));
    }

    notifyListeners();
  }

  MissionModel getById(int id) => missions.firstWhere((mission) => mission.id == id);

  MissionModel getByPosition(int position){
    return getById(position);
  }
  
  void accomplishMission(int id) {
    var mission = getById(id);
    var indexOfMission = missions.indexOf(mission);

    debugPrint('accomplish mission $id at index $indexOfMission');
    
    mission.accomplished = true;
    
    missions[indexOfMission] = mission;
    debugPrint('mission $id is now ${getById(indexOfMission).accomplished}');
    notifyListeners();
  }

  int getNumberOfMissions() => missions.length;

  int getNumberOfMissionsForCurrentPlayerLevel(int userLevel) => missions.where((mission) => userLevel >= mission.level).length;
}