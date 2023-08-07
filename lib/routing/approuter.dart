import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../auth/auth_provider.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/mission_details_screen.dart';
import '../screens/missions_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/shop_screen.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
        return const MyHomePage(title: 'drivr');
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
        return const ProfileScreen();
      },
    ),
    GoRoute(
      path: '/missions',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
        return const MissionsScreen();
      },
    ),
    GoRoute(
      path: '/missions/:missionId',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
        return MissionDetailsScreen(
            currentMissionId:
            int.parse(state.pathParameters['missionId'] ?? ""));
      },
    ),
    GoRoute(
      path: '/shop',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
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
          if (!context.read<AuthProvider>().isLoggedIn) {
            return const LoginScreen();
          }
          return const MyHomePage(title: 'drivr');
        })
  ]);
}