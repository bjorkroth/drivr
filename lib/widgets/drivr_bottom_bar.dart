import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/profile_model.dart';

class DrivrBottomBar extends StatelessWidget{
  DrivrBottomBar({super.key, required this.menuBarSelectedItem});

  final int menuBarSelectedItem;

  @override
  Widget build(BuildContext context) {
    var playerIsLoggedIn = context.read<ProfileModel>().isLoggedIn;

    final List<String> pageUrls = [
      '/home',
      '/missions',
      '/shop',
      '/profile'
    ];

    void onItemTapped(int index){
      if(playerIsLoggedIn == false){
        context.go('/login');
        return;
      }

      context.go(pageUrls[index]);
    }

    var menuItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_filled),
        label: 'Home',
        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'Login',
          backgroundColor: Theme.of(context).colorScheme.inversePrimary)
    ];

    if(playerIsLoggedIn){
      var loggedInMenuItems = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_filled),
          label: 'Home',
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.games_outlined),
            label: 'Missions',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.shop_2_outlined),
            label: 'Shop',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      ];

      menuItems = loggedInMenuItems;
    }

    return Stack(
      children: <Widget>[
        BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            selectedItemColor: Colors.white70,
            currentIndex: menuBarSelectedItem,
            onTap: onItemTapped,
            items: menuItems,
        ),
      ],
    );
  }

}