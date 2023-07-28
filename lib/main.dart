import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'models/profile_model.dart';
import 'data/missionList.dart';
import 'widgets/profile.dart';
import 'widgets/login.dart';
import 'widgets/missions.dart';
import 'widgets/shop.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (context) => MissionsList()),
    ChangeNotifierProxyProvider(
      create: (context) => ProfileModel(),
      update: (context,_,profile) {
        if(profile == null) throw ArgumentError.notNull('profile');
        return profile;
      }
    )
  ],
  child: const MyApp()
  ));
}

final GoRouter _goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const Login();
    },
  ),
  GoRoute(
    path: '/profile',
    builder: (BuildContext context, GoRouterState state) {
      return const Profile();
    },
  ),
  GoRoute(
    path: '/missions',
    builder: (BuildContext context, GoRouterState state) {
      return const Missions();
    },
  ),
  GoRoute(
    path: '/shop',
    builder: (BuildContext context, GoRouterState state) {
      return const Shop();
    },
  ),
  GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      }),
  GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      })
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp.router(
      title: 'drivr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _goRouter,
    );
  }
}
