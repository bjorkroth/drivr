
import 'package:drivr/data/mission_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mission_model.dart';

class MissionsList extends ChangeNotifier {
  List<MissionModel> missions = [];

  Future<void> loadMissions() async {
    missions = await MissionStorage().readMissions();
    notifyListeners();
  }

  Future<MissionModel> getByIdAsync(int id) async =>
      await MissionStorage().getMissionById(id);

  MissionModel getById(int id) => missions.firstWhere((mission) => mission.id == id);

  MissionModel getByPosition(int position){
    return getById(position);
  }

  Future<void> accomplishMissionAsync(int id) async{
     final prefs = await SharedPreferences.getInstance();
     prefs.setBool('mission-$id', true);
     
     await MissionStorage().postAccomplishMission(id);
     await loadMissions();
     notifyListeners();
  }

  void accomplishMission(int id) {
    // var mission = getById(id);
    // var indexOfMission = missions.indexOf(mission);
    // debugPrint('accomplish mission $id at index $indexOfMission');
    // mission.accomplished = true;
    //
    // missions[indexOfMission] = mission;
    // debugPrint('mission $id is now ${getById(indexOfMission).accomplished}');
    //
    // updateSaveFile().then((value) => {
    //   notifyListeners()
    // });
  }

  Future<void> updateSaveFile() async{
    await MissionStorage().writeMissions(missions);
  }

  int getNumberOfMissions() => missions.length;

  int getNumberOfMissionsForCurrentPlayerLevel(int userLevel) => missions.where((mission) => userLevel >= mission.level).length;
}