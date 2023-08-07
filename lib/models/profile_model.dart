import '../data/profile_storage.dart';
import '../extenders/get_user_level_for_experiencepoints.dart';
import 'package:flutter/widgets.dart';

class ProfileModel extends ChangeNotifier {
  String id = "";

  String name = "";

  int currentLevel = 1;
  late int experience = getExperience();

  ProfileModel();

  ProfileModel.create(this.id, this.name, this.experience, this.currentLevel);

  int getExperience(){
    ProfileStorage().getExperience().then((value) => experience = value);
    return experience;
  }

  Future<void> setName(String name) async{
    name = name;
    await ProfileStorage().setName(name);
    notifyListeners();
  }

  Future<void> saveExperience(int amount) async{
    experience += amount;
    await ProfileStorage().updateExperience(amount);
    await updateUserLevel();
    notifyListeners();
  }

  Future<void> updateUserLevel() async{
    var userLevel  = GetUserLevelForExperiencePoints().getLevel(experience);
    await ProfileStorage().updateLevel(userLevel);
    currentLevel = userLevel;
  }

  factory ProfileModel.fromJson(Map<String,dynamic> data){
    final String id = data['id'];
    final String name = data['name'];
    final int level = data['level'];
    final int experience = data['experience'];

    return ProfileModel.create(id, name, experience, level);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'level': currentLevel,
      'experience': experience,
    };
  }
}