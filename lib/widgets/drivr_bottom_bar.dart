import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrivrBottomBar extends StatelessWidget{
  DrivrBottomBar({super.key, required this.menuBarSelectedItem});

  final int menuBarSelectedItem;

  @override
  Widget build(BuildContext context) {
    final List<String> pageUrls = [
      '/home',
      '/missions',
      '/shop',
      '/profile'
    ];

    void onItemTapped(int index){
      debugPrint('bottom bar index is now $menuBarSelectedItem');
      context.go(pageUrls[index]);
    }

    return Stack(
      children: <Widget>[
        BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            selectedItemColor: Colors.white70,
            currentIndex: menuBarSelectedItem,
            onTap: onItemTapped,
            items: <BottomNavigationBarItem>[
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
            ]
        ),
      ],
    );
  }

}