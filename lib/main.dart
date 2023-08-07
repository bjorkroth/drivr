import 'package:drivr/auth/auth_provider.dart';
import 'package:drivr/initializers/initializer.dart';
import 'package:drivr/routing/approuter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/profile_model.dart';
import 'data/missionList.dart';

void main() async {
  runApp(MultiProvider(providers: [
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
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Initializer().run();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'drivr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().goRouter,
    );
  }
}
