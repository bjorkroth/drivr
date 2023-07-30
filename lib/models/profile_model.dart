import 'package:flutter/widgets.dart';

class ProfileModel extends ChangeNotifier {
  String _name = "";
  String get name => _name;

  bool _isLoggedin = false;
  bool get isLoggedIn => _isLoggedin;

  int currentLevel = 1;
  double experience = 0;

  void setName(String name){
    _name = name;
    notifyListeners();
  }

  void logInUser(){
    _isLoggedin = true;
    notifyListeners();
  }

  void logOutUser(){
    _isLoggedin = false;
    notifyListeners();
  }

  void updateExperience(double amount){
    experience += amount;
    updateUserLevel();
    notifyListeners();
  }

  updateUserLevel(){
    if(experience > 35){
      currentLevel = 2;
    }

    if(currentLevel > 100){
      currentLevel = 3;
    }

    if(currentLevel > 250){
      currentLevel = 4;
    }

    if(currentLevel > 600){
      currentLevel = 5;
    }
  }
}