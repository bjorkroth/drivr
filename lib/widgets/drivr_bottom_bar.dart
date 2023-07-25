import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrivrBottomBar extends StatelessWidget{
  const DrivrBottomBar({super.key});

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> pageUrls = [
      '/home',
      '/missions',
      '/profile'
    ];

    void onItemTapped(int index){
      context.go(pageUrls[index]);
    }

    return Stack(
      children: <Widget>[
        BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            selectedItemColor: Colors.white60,
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
            items: const<BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.games_outlined), label: 'Missions'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ]
        ),
      ],
    );
  }

}