import 'package:flutter/material.dart';

import '../models/mission_model.dart';

class MissionsList extends ChangeNotifier {
  static List<MissionModel> missions = [
    MissionModel(0,'First mission', 1, false, 'Mission Description', 20),
    MissionModel(1,'Second mission', 1, false, 'Mission Description', 20),
    MissionModel(2,'Third mission', 1, false, 'Mission Description', 25),
    MissionModel(3,'Fourth mission', 2, false, 'Mission Description', 25),
    MissionModel(4,'Fifth mission', 3, false, 'Mission Description', 20),
    MissionModel(5,'Sixth mission', 4, false, 'Mission Description', 25),
    MissionModel(6,'Seventh mission', 5, false, 'Mission Description', 30),
  ];

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