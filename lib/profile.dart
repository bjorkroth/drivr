import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold (
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 150,
              ),
              Text('Profile for User', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Profile description')
            ],
          )
        )
    );
  }
}
