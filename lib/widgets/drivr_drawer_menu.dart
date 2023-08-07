import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrivrDrawerMenu extends StatelessWidget{
  const DrivrDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(decoration: BoxDecoration(
            color: Colors.blue,
          ), child: Text('Menu'),),
          ListTile(
            title: const Text('Settings'),
            onTap: (){
              context.go('/settings');
            },
          ),
        ],
      ),
    );
  }

}