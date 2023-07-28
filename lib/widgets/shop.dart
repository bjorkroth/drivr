import 'package:flutter/material.dart';
import 'drivr_app_bar.dart';
import 'drivr_bottom_bar.dart';

class Shop extends StatelessWidget{
  const Shop({super.key});

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
                Icons.shop_outlined,
                size: 150,
              ),
              // }),
            ],
          )
      ),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 2),
    );
  }
}
