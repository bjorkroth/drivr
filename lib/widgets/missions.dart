import 'drivr_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'drivr_app_bar.dart';

class Missions extends StatelessWidget{
  const Missions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: DrivrAppBar(
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
        body: const Center(
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
        ),
        bottomNavigationBar: const DrivrBottomBar(),
    );
  }
}
