abstract class ProfilePersistence{
  Future<void> setName(String name);
  Future<void> setId(String id);
  Future<String> getName();
  Future<String> getId();
}