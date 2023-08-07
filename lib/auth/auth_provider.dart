import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String _currentUser = "";
  String get currentUser => _currentUser;

  late SharedPreferences sharedPreferences;

  AuthProvider(){
    SharedPreferences.getInstance().then((SharedPreferences sp){
      sharedPreferences = sp;
      _isLoggedIn = sp.getBool('isLoggedIn') ?? false;
    });
  }

  Future<bool> isUserLoggedIn() async{
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  Future<void> logInUser(String username) async{
    _currentUser = username;
    _isLoggedIn = true;
    await sharedPreferences.setBool('isLoggedIn', true);
    notifyListeners();
  }

  Future<void> logOutUser() async{
    await sharedPreferences.setBool('isLoggedIn', false);
    _currentUser = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}