import 'dart:async';
import 'package:drivr/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/profile_persistance.dart';

class LocalStorageProfileStorage extends ProfilePersistence{
  final Future<SharedPreferences> instanceFuture = SharedPreferences.getInstance();

  @override
  Future<String> getName() async {
    var sharedPreferences = await instanceFuture;
    return sharedPreferences.getString('profile-name') ?? "";
  }

  @override
  Future<void> setName(String name) async{
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setString('profile-name', name);
  }

  @override
  Future<String> getId() async {
    var sharedPreferences = await instanceFuture;
    return sharedPreferences.getString('profile-id') ?? "";
  }

  @override
  Future<void> setId(String id) async{
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setString('profile-id', id);
  }

  @override
  Future<ProfileModel> getProfileById(String profileId) {
    // TODO: implement getProfileById
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> getProfileByUserName(String profileName) {
    // TODO: implement getProfileByUserName
    throw UnimplementedError();
  }
}