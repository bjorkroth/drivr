import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import '../models/profile_model.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = AuthProvider().isUserLoggedIn();

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
              FutureBuilder(
                future: isLoggedIn,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      if(snapshot.data! == false) {
                        return const Column(children: [ Text('User is not logged in', style: TextStyle(fontWeight: FontWeight.bold))]);
                      }
                      return Consumer<ProfileModel>(builder: (context,profile,child){
                        return Column(
                          children: [
                            Text('Profile name ${profile.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Current level: ${profile.currentLevel}'),
                            Text('Current XP: ${profile.experience} XP')
                          ],
                        );
                      });
                    }
                    return const CircularProgressIndicator();
                  }),
              // }),
            ],
          )
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 3),
    );
  }
}
