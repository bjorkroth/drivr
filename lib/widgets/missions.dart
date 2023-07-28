import 'drivr_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'drivr_app_bar.dart';
import 'package:drivr/widgets/missionListItem.dart';

class Missions extends StatelessWidget{
  const Missions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: DrivrAppBar(
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
        body:CustomScrollView(slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 4)),
                  SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) => MissionListItem(index)))
                ],),
        bottomNavigationBar: const DrivrBottomBar(),
    );
  }
}
