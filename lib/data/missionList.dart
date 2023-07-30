import '../models/mission_model.dart';

class MissionsList {
  static List<MissionModel> missions = [
    MissionModel(0,'First mission', 1, false),
    MissionModel(1,'Second mission', 1, false),
    MissionModel(2,'Third mission', 1, false),
    MissionModel(3,'Fourth mission', 2, false),
    MissionModel(3,'Fifth mission', 3, false),
    MissionModel(3,'Sixth mission', 4, false),
    MissionModel(3,'Seventh mission', 5, false),
  ];

  MissionModel getById(int id) => missions.firstWhere((mission) => mission.id == id);

  MissionModel getByPosition(int position){
    return getById(position);
  }

  int getNumberOfMissions() => missions.length;

  int getNumberOfMissionsForCurrentPlayerLevel(int userLevel) => missions.where((mission) => userLevel >= mission.level).length;
}