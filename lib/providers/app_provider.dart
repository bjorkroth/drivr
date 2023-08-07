import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../auth/auth_provider.dart';
import '../data/missionList.dart';
import '../models/profile_model.dart';

class AppProvider{
  List<SingleChildWidget> providers = [
    ChangeNotifierProxyProvider(
        create: (context) => AuthProvider(),
        update: (context, _, auth) {
          if (auth == null) throw ArgumentError.notNull('auth');
          return auth;
        }),
    ChangeNotifierProxyProvider(
      create: (context) {
        var missionList = MissionsList();
        return missionList;
      },
      update: (context, _, missions) {
        if (missions == null) throw ArgumentError.notNull('missions_list');
        return missions;
      },
    ),
    ChangeNotifierProxyProvider(
        create: (context) => ProfileModel(),
        update: (context, _, profile) {
          if (profile == null) throw ArgumentError.notNull('profile');
          return profile;
        })
  ];
}