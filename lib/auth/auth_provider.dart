import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String _currentUser = "";
  String get currentUser => _currentUser;

  Future<bool> isUserLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getBool('isLoggedIn'));
  }

  Future<void> logInUser(String username) async{
    _currentUser = username;
    _isLoggedIn = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    notifyListeners();
  }

  Future<void> logOutUser() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    _currentUser = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}