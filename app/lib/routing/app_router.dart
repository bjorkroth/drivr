import 'package:drivr/screens/mission_question_screen.dart';
import 'package:drivr/screens/settings_screen.dart';
import 'package:drivr/widgets/correct_question_answer.dart';
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
        var isLoggedInFuture = context.read<AuthProvider>().isUserLoggedIn();
        return FutureBuilder(future: isLoggedInFuture,
            builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              if(snapshot.data == true){
                return const HomeScreen(title: 'drivr');
              }
              return const LoginScreen();
            }
          }
          return const CircularProgressIndicator();
        });
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
            int.parse(state.pathParameters['missionId'] ?? ""),
            currentUserId: context.read<AuthProvider>().currentUser
        );
      },
    ),
    GoRoute(
      path: '/missions/:missionId/questions',
      builder: (BuildContext context, GoRouterState state) {
        if (!context.read<AuthProvider>().isLoggedIn) {
          return const LoginScreen();
        }
        return MissionQuestionScreen(
            currentMissionId:
            int.parse(state.pathParameters['missionId'] ?? ""),
            // currentQuestionId:
            // int.parse(state.pathParameters['questionId'] ?? ""),
            currentUserId: context.read<AuthProvider>().currentUser
        );
      },
    ),
    GoRoute(path: '/missions/questions/correct', builder: (BuildContext context, GoRouterState state){
      if (!context.read<AuthProvider>().isLoggedIn) {
        return const LoginScreen();
      }

      return const CorrectQuestionAnswer();
    }),
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
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
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
          return const HomeScreen(title: 'drivr');
        })
  ]);
}