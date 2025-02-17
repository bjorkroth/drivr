import 'dart:convert';

import 'package:drivr/models/profile_model.dart';
import 'package:http/http.dart' as http;

import 'profile_persistance.dart';

class DatabaseProfileStorage extends ProfilePersistence{
  static const String apiUrl = "https://api-drivr-test-bgebb6bqa5caa7fn.swedencentral-01.azurewebsites.net";

  @override
  Future<String> getId() {
    // TODO: implement getId
    throw UnimplementedError();
  }

  @override
  Future<String> getName() {
    // TODO: implement getName
    throw UnimplementedError();
  }

  @override
  Future<void> setId(String id) {
    // TODO: implement setId
    throw UnimplementedError();
  }

  @override
  Future<void> setName(String name) {
    // TODO: implement setName
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> getProfileById(String profileId) async {
    try{
      final response = await http.get(Uri.parse('$apiUrl/users/$profileId'));

      if(response.statusCode != 200){
        throw Exception("Could not get user ");
      }

      dynamic data = await json.decode(response.body);
      return ProfileModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Could not get mission");
    }
  }

  @override
  Future<ProfileModel> getProfileByUserName(String profileName) async {
    try{
      final response = await http.get(Uri.parse('$apiUrl/users/profileName/$profileName'));

      if(response.statusCode != 200){
        throw Exception("Could not get user ");
      }

      dynamic data = await json.decode(response.body);
      return ProfileModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Could not get mission");
    }
  }

  @override
  Future<void> putUserExperience(int progressExperience, String userId) async {
    try{
      final response = await http.put(Uri.parse('$apiUrl/users/$userId/experience/$progressExperience'));

      if(response.statusCode != 200){
        throw Exception("Could not update user experience ");
      }
    } catch (e) {
      throw Exception("Could not update user experience ");
    }
  }

  @override
  Future<void> putUserLevel(int progressLevel, String userId) async {
    try{
      final response = await http.put(Uri.parse('$apiUrl/users/$userId/level/$progressLevel'));

      if(response.statusCode != 200){
        throw Exception("Could not update user level ");
      }
    } catch (e) {
      throw Exception("Could not update user level ");
    }
  }

}