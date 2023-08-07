import 'package:flutter/widgets.dart';

import '../data/profile_persistance.dart';

class ProfileModel extends ChangeNotifier {
  String id = "";
  String name = "";

  final ProfilePersistence _store;

  ProfileModel(ProfilePersistence store) : _store = store;

  Future<void> getLatestFromStore() async{
    final storeName = await _store.getName();
    name = storeName;

    final storeId = await _store.getId();
    id = storeId;

    notifyListeners();
  }

  Future<void> setName(String name) async{
    name = name;
    await _store.setName(name);
    notifyListeners();
  }
}