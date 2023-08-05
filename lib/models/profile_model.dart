import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileModel extends ChangeNotifier {
  String _name = "";
  String get name => _name;

  int currentLevel = 1;
  late int experience = getExperience();

  int getExperience(){
    int experience = 0;
    getExperienceAsync().then((value) => experience = value);
    return experience;
  }

  Future<void> setName(String name) async{
    _name = name;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);

    notifyListeners();
  }

  Future<int> getExperienceAsync() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('experience') ?? 0;
  }

  Future<void> saveExperience(int amount) async{
    final prefs = await SharedPreferences.getInstance();
    int currentExperience = prefs.getInt('experience') ?? 0;
    currentExperience += amount;
    await prefs.setInt('experience', currentExperience);
  }

  void updateExperience(int amount){
    experience += amount;

    saveExperience(amount).then((value) => {
        updateUserLevel(),
        notifyListeners()
    });
  }

  updateUserLevel(){
    if(experience > 35){
      currentLevel = 2;
    }

    if(experience > 100){
      currentLevel = 3;
    }

    if(experience > 250){
      currentLevel = 4;
    }

    if(experience > 600){
      currentLevel = 5;
    }
  }
}