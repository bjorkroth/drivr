abstract class ProgressPersistence{
  Future<void> saveExperience(int updatedAmount);
  Future<void> updateUserLevel(int level);
  Future<int> getUserLevel();
  Future<int> getExperience();
}