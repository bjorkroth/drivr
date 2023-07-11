import 'package:flutter/material.dart';

class Missions extends StatelessWidget{
  const Missions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold (
        body: Center(
            child: Column(
              children: [
                Icon(
                  Icons.games_outlined,
                  size: 150,
                ),
                Text('Missions', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Mission tree')
              ],
            )
        )
    );
  }
}
