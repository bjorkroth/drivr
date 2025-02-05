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

  Future<void> saveExperience(int amount) async{
    experience += amount;
    await _store.saveExperience(experience);
    await updateUserLevel();
    notifyListeners();
  }

  Future<void> updateUserLevel() async{
    var userLevel  = GetUserLevelForExperiencePoints().getLevel(experience);
    await _store.updateUserLevel(userLevel);
    currentLevel = userLevel;
  }
}