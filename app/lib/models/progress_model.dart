import 'package:drivr/data/database_profile_storage.dart';
import 'package:flutter/material.dart';

import '../data/progress_persistence.dart';
import '../extenders/get_user_level_for_experiencepoints.dart';

class ProgressModel extends ChangeNotifier{
  int currentLevel = 1;
  int experience = 0;

  final ProgressPersistence _store;

  ProgressModel(ProgressPersistence store) : _store = store;

  Future<void> getLatestFromStore() async{
    final storedLevel = await _store.getUserLevel();
    if(storedLevel > currentLevel){
      currentLevel = storedLevel;
      notifyListeners();
    }

    final storedExperience = await _store.getExperience();
    if(storedExperience > experience){
      experience = storedExperience;
      notifyListeners();
    }
  }

  Future<void> saveExperience(int amount, String userId) async{
    experience += amount;
    await _store.saveExperience(experience);
    //await DatabaseProfileStorage().putUserExperience(experience, userId);
    await updateUserLevel(userId);
    notifyListeners();
  }

  Future<void> updateUserLevel(String userId) async{
    var userLevel  = GetUserLevelForExperiencePoints().getLevel(experience);

    if(currentLevel == userLevel){
      return;
    }

    await _store.updateUserLevel(userLevel);
    currentLevel = userLevel;
    //await DatabaseProfileStorage().putUserLevel(userLevel, userId);
  }
}