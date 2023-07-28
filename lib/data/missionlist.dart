import '../models/mission_model.dart';

class MissionsList {
  static List<MissionModel> missions = [
    const MissionModel(1,'First mission', 1, false),
    const MissionModel(2,'Second mission', 1, false),
    const MissionModel(3,'Third mission', 1, false),
    const MissionModel(4,'Fourth mission', 2, false),
  ];

  MissionModel getById(int id) => missions.firstWhere((mission) => mission.id == id);

  MissionModel getByPosition(int position){
    return getById(position);
  }
}