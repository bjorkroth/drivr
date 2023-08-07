import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../initializers/initializer.dart';
import '../providers/app_provider.dart';
import '../routing/app_router.dart';

void main() async {
  runApp(MultiProvider(
      providers: AppProvider().providers,
      child: MyApp()));
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
