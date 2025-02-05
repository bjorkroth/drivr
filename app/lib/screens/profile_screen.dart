import 'package:drivr/widgets/profile_screen_details.dart';
import 'package:flutter/material.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../widgets/drivr_drawer_menu.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Profile',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: const Center(
          child: Column(
            children: [
               Icon(
                Icons.person,
                size: 150,
              ),
              ProfileScreenDetails(),
            ],
          )
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 3),
    );
  }
}
