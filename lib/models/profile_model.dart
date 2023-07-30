import 'package:flutter/widgets.dart';

class ProfileModel extends ChangeNotifier {
  String _name = "";
  String get name => _name;

  bool _isLoggedin = false;
  bool get isLoggedIn => _isLoggedin;

  int get currentLevel => 2;

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
}