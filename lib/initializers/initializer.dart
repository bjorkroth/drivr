import 'create_local_profile_file.dart';
import 'create_local_mission_file.dart';

class Initializer{
  void run() async{
    await CreateLocalMissionFile().createLocalMissionFileIfNotExist();
    await CreateLocalProfileFile().createLocalProfileFileIfNotExist();
  }
}