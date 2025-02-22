import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../auth/auth_provider.dart';
import '../data/local_storage_progress_persistence.dart';
import '../models/progress_model.dart';
import '../data/mission_list.dart';

class AppProvider{
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context){
      var progress = ProgressModel(LocalStorageProgressPersistence());
      progress.getLatestFromStore();
      return progress;
    }),
    ChangeNotifierProxyProvider(
        create: (context) {
          var authProvider = AuthProvider();
          authProvider.getStatusFromStore();
          return authProvider;
        },
        update: (context, _, auth) {
          if (auth == null) throw ArgumentError.notNull('auth');
          return auth;
        }),
    ChangeNotifierProxyProvider(
      create: (context) {
        var missionList = MissionsList();
        missionList.loadMissions();
        return missionList;
      },
      update: (context, _, missions) {
        if (missions == null) throw ArgumentError.notNull('missions_list');
        return missions;
      },
    ),
    ChangeNotifierProxyProvider(
        create: (context){
          // var profile = ProfileModel(LocalStorageProfileStorage());
          // profile.getLatestFromStore();
          // return profile;
        },
        update: (context, _, profile) {
          // if (profile == null) throw ArgumentError.notNull('profile');
          // return profile;
        })
  ];
}