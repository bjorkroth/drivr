import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  Future<Map<String,String>> getData() async{
    var sharedPreferences = await SharedPreferences.getInstance();

    var isLoggedIn =  sharedPreferences.getBool('isLoggedIn') ?? false;
    var profileName =  sharedPreferences.getString('profile-name') ?? "";
    var progressLevel =  sharedPreferences.getInt('progress-level') ?? 0;
    var progressExperience =  sharedPreferences.getInt('progress-experience') ?? 0;

    return Map.of({
      "isLoggedIn": isLoggedIn.toString(),
      "profile-name": profileName,
      "progress-level": progressLevel.toString(),
      "progress-experience": progressExperience.toString()
    });
  }
}