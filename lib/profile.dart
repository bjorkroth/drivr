import 'package:drivr/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body: Center(
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 150,
              ),
              Consumer<ProfileModel>(builder: (context,profile,child){
                return Text('Profile for ${profile.name}', style: const TextStyle(fontWeight: FontWeight.bold));
              }),
              const Text('Profile description')
            ],
          )
        )
    );
  }
}
