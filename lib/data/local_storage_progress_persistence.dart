import 'package:drivr/data/progress_persistence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProgressPersistence extends ProgressPersistence{
  final Future<SharedPreferences> instanceFuture =
  SharedPreferences.getInstance();

  @override
  Future<void> saveExperience(int updatedAmount) async {
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setInt('progress-experience', updatedAmount);
  }

  @override
  Future<void> updateUserLevel(int level) async {
    var sharedPreferences = await instanceFuture;
    await sharedPreferences.setInt('progress-level', level);
  }

  @override
  Future<int> getExperience() async{
    var sharedPreferences = await instanceFuture;
    return sharedPreferences.getInt('progress-experience') ?? 0;
  }

  @override
  Future<int> getUserLevel() async{
    var sharedPreferences = await instanceFuture;
    return sharedPreferences.getInt('progress-level') ?? 0;
  }
}