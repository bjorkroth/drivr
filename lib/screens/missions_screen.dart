import 'package:drivr/data/missionList.dart';
import 'package:provider/provider.dart';

import '../widgets/drivr_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/missionListItem.dart';

class MissionsScreen extends StatelessWidget{
  const MissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var numberOfMissions = context.read<MissionsList>().getNumberOfMissions();

    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Missions',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
        body:CustomScrollView(
          slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 4)),
                  SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) => MissionListItem(index), childCount: numberOfMissions))
                ],),
        bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 1),
    );
  }
}
