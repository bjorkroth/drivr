import '../models/mission_model.dart';

class MissionsList {
  static List<MissionModel> missions = [
    MissionModel(0,'First mission', 1, false),
    MissionModel(1,'Second mission', 1, false),
    MissionModel(2,'Third mission', 1, false),
    MissionModel(3,'Fourth mission', 2, false),
  ];

  MissionModel getById(int id) => missions.firstWhere((mission) => mission.id == id);

  MissionModel getByPosition(int position){
    return getById(position);
  }
}