import 'package:flutter/widgets.dart';

class ProfileModel extends ChangeNotifier {
  final String id;
  final String name;
  final String profileName;
  final String email;
  final int progressLevel;
  final int progressExperience;

  ProfileModel(
      this.id,
      this.name,
      this.profileName,
      this.email,
      this.progressLevel,
      this.progressExperience
      );

  factory ProfileModel.fromJson(Map<String,dynamic> data){
    final String id = data['id'];
    final String name = data['name'];
    final String email = data['email'];
    final String profileName = data['profileName'];
    final int progressLevel = data['progressLevel'];
    final int progressExperience = data['progressExperience'];

    return ProfileModel(id, name, profileName, email, progressLevel, progressExperience);
  }
}