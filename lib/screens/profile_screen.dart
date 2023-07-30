import '../models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: DrivrAppBar(
            title: 'Profile',
            preferredSize: const Size.fromHeight(80.0),
            child: Container()),
        body: Center(
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 150,
              ),
              Consumer<ProfileModel>(builder: (context,profile,child){
                if(profile.isLoggedIn){
                  return Column(
                    children: [
                      Text('Profile name ${profile.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Current level: ${profile.currentLevel}')
                    ],
                  );
                }
                return const Column(children: [ Text('User is not logged in', style: TextStyle(fontWeight: FontWeight.bold))]);
              }),
              // }),
            ],
          )
        ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 3),
    );
  }
}
