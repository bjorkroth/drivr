import 'package:drivr/widgets/login.dart';
import 'package:drivr/widgets/missions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'widgets/home.dart';
import 'models/profile_model.dart';
import 'widgets/profile.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProfileModel(),
    child: const MyApp(),
  ));
}

final GoRouter _goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const MyHomePage(title: 'drivr');
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
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      }),
  GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'drivr');
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
