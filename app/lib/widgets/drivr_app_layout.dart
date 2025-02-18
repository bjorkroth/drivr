import 'package:flutter/material.dart';

import 'drivr_app_bar.dart';
import 'drivr_bottom_bar.dart';
import 'drivr_drawer_menu.dart';

class DrivrAppLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final int menuBarSelectedItem;
  const DrivrAppLayout(
      {super.key,
      required this.title,
      this.menuBarSelectedItem = 1,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DrivrAppBar(
            title: title,
            preferredSize: const Size.fromHeight(80.0),
            child: Container()),
        drawer: const DrivrDrawerMenu(),
        body: child,
        bottomNavigationBar:
            DrivrBottomBar(menuBarSelectedItem: menuBarSelectedItem));
  }
}
