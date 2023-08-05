import 'package:drivr/auth/auth_provider.dart';
import 'package:drivr/screens/home_screen.dart';
import 'package:drivr/screens/mission_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'models/profile_model.dart';
import 'data/missionList.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/missions_screen.dart';
import 'screens/shop_screen.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProxyProvider(
        create: (context) => AuthProvider(),
        update: (context,_,auth){
          if(auth == null) throw ArgumentError.notNull('auth');
          return auth;
        }),
    ChangeNotifierProxyProvider(
        create: (context) {
          var missionList = MissionsList();
          return missionList;
        },
        update: (context,_,missions){
          if(missions == null) throw ArgumentError.notNull('missions_list');
          return missions;
        },
    ),
    ChangeNotifierProxyProvider(
      create: (context) => ProfileModel(),
      update: (context,_,profile) {
        if(profile == null) throw ArgumentError.notNull('profile');
        return profile;
      }
    )
  ],
  child: MyApp()
  ));
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _goRouter = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
        return const MyHomePage(title: 'drivr');
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
        return const ProfileScreen();
      },
    ),
    GoRoute(
      path: '/missions',
      builder: (BuildContext context, GoRouterState state) {
        if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
        return const MissionsScreen();
      },
    ),
    GoRoute(
      path: '/missions/:missionId',
      builder: (BuildContext context, GoRouterState state) {
        if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
        return MissionDetailsScreen(currentMissionId: int.parse(state.pathParameters['missionId'] ?? ""));
      },
    ),
    GoRoute(
      path: '/shop',
      builder: (BuildContext context, GoRouterState state) {
        if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
        return const ShopScreen();
      },
    ),
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
    GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          if(!context.read<AuthProvider>().isLoggedIn) return const LoginScreen();
          return const MyHomePage(title: 'drivr');
        })
  ]);

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
