import '../models/profile_model.dart';

abstract class ProfilePersistence{
  Future<void> setName(String name);
  Future<void> setId(String id);
  Future<String> getName();
  Future<String> getId();
  Future<ProfileModel> getProfileById(String profileId);
  Future<ProfileModel> getProfileByUserName(String profileName);
  Future<void> putUserExperience(int progressExperience, String userId);
  Future<void> putUserLevel(int progressLevel, String userId);

}