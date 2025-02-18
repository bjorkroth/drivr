import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget{
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrivrAppLayout(title: 'Shop',
      menuBarSelectedItem: 2,
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.shop_outlined,
              size: 150,
            ),
            // }),
          ],
        )
    ),);
  }
}
