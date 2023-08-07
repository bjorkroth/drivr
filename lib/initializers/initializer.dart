import 'create_local_mission_file.dart';

class Initializer{
  void run() async{
    await CreateLocalMissionFile().createLocalMissionFileIfNotExist();
  }
}