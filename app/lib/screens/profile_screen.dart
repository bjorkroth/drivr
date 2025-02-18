import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/profile_screen_details.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return const DrivrAppLayout(title: 'Profile',
      menuBarSelectedItem: 2,
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 150,
            ),
            ProfileScreenDetails(),
          ],
        )
    ),);
  }
}
