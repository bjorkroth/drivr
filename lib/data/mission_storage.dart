import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

import '../models/mission_model.dart';

class MissionStorage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localFile async {
    final path = await _localPath;
    return '$path/missions.json';
  }

  Future<List<MissionModel>> readMissions() async {
    try {
      final filePath = await _localFile;

      // Read the file
      var file = File(filePath);
      var contents = await file.readAsString();
      List<dynamic> data = await json.decode(contents);

      List<MissionModel> missions = [];
      for (var element in data) {
        missions.add(MissionModel.fromJson(element));
      }

      return missions;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future<void> writeMissions(List<MissionModel> missions) async {
    final filepath = await _localFile;
    var file = File(filepath);

    var jsonMap = [];
    for(var mission in missions){
      jsonMap.add(mission.toJson());
    }
    var json = jsonEncode(jsonMap);

    await file.writeAsString(json);
    return;
  }


}