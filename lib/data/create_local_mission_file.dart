import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../models/mission_model.dart';
import 'package:flutter/services.dart';

class CreateLocalMissionFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localFile async {
    final path = await _localPath;
    return '$path/missions.json';
  }

  Future<List<MissionModel>> get _readMissionsFromAssets async{
    // Read the file
    final contents = await rootBundle.loadString('assets/missions.json');
    List<dynamic> data = await json.decode(contents);

    List<MissionModel> missions = [];
    for (var element in data) {
      missions.add(MissionModel.fromJson(element));
    }
    return missions;
  }

  Future<void> createLocalMissionFileIfNotExist() async{
    var filepath = await _localFile;

    if(await File(filepath).exists()){
      return;
    }

    var missions = await _readMissionsFromAssets;

    try{
      var jsonMap = [];
      for(var mission in missions){
        jsonMap.add(mission.toJson());
      }
      var json = jsonEncode(jsonMap);
      var file = File(filepath);
      await file.writeAsString(json, mode: FileMode.write);
    } on Exception catch(e){
      debugPrint(e.toString());
      return;
    }

    return;
  }

}