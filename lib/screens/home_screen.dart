import 'package:drivr/widgets/drivr_drawer_menu.dart';
import 'package:flutter/material.dart';

import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Home',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: const Center(
          child: Text('Home page')
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 0),
    );
  }
}