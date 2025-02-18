import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String _currentUser = "";
  String get currentUser => _currentUser;

  final Future<SharedPreferences> instanceFuture = SharedPreferences.getInstance();

  Future<void> getStatusFromStore() async{
    var sharedPreferences = await instanceFuture;
    _isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
    _currentUser = sharedPreferences.getString('currentUser') ?? "";
  }

  Future<bool> isUserLoggedIn() async{
    var sharedPreferences = await instanceFuture;
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  Future<void> logInUser(String username) async{
    _currentUser = username;
    _isLoggedIn = true;
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setBool('isLoggedIn', true);
    await sharedPreferences.setString('currentUser', username);
    notifyListeners();
  }

  Future<void> logOutUser() async{
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setBool('isLoggedIn', false);
    await sharedPreferences.setString('currentUser', "");
    _currentUser = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}