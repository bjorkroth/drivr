import 'package:flutter/material.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';

class ShopScreen extends StatelessWidget{
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: DrivrAppBar(
          title: 'Shop',
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
