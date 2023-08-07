import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drivr/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProfileStorage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localFile async {
    final path = await _localPath;
    var filepath = '$path/profile_data.json';
    return filepath;
  }

  Future<ProfileModel> get readUserData async{
    try{
      final filePath = await _localFile;
      var file = File(filePath);
      var contents = await file.readAsString();
      Map<String,dynamic> data = await json.decode(contents);
      var profile = ProfileModel.fromJson(data);

      return profile;
    } on Exception catch(e){
      debugPrint(e.toString());
      return ProfileModel();
    }
  }

  Future<bool> saveUserData(ProfileModel profile) async{
    try{
      final filepath = await _localFile;
      var file = File(filepath);

      var jsonMap = profile.toJson();
      var json = jsonEncode(jsonMap);
      file.openWrite();
      await file.writeAsString(json, mode: FileMode.write);

      return true;
    } catch (e){
      return false;
    }
  }

  Future<String> getName() async{
    var user = await readUserData;
    return user.name;
  }

  Future<void> setName(String name) async{
    var user = await readUserData;
    user.name = name;
    await saveUserData(user);
    return;
  }

  Future<int> getExperience() async{
    var user = await readUserData;
    return user.experience;
  }

  Future<int> updateExperience(int amount) async{
    var user = await readUserData;
    int currentExperience = user.experience;
    currentExperience += amount;
    user.experience = currentExperience;

    await saveUserData(user);
    return currentExperience;
  }

  Future<int> getLevel() async{
    var user = await readUserData;
    return user.currentLevel;
  }

  Future<int> updateLevel(int level) async{
    var user = await readUserData;
    user.currentLevel = level;
    await saveUserData(user);
    return level;
  }
}