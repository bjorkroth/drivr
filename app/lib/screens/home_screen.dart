import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:drivr/widgets/home_slider_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../auth/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    if (!authProvider.isLoggedIn || authProvider.currentUser.isEmpty) {
      context.go('/login');
    }

    // var currentUser = context.read<ProfileModel>();
    var currentUser = "Current user";
    Animation<double> animation = const AlwaysStoppedAnimation(0);
    var headerTextStyle =
        const TextStyle(fontFamily: 'Montserrat', fontSize: 25);

    return DrivrAppLayout(title: "Home", child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    child: Text(
                      'Welcome $currentUser!',
                      style: headerTextStyle,
                    ))
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text('Your progress')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0),
              height: 200,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HomeSliderCard(
                      title: 'Experience',
                      cardValue: '965 XP',
                      color: Colors.red,
                      heroAnimation: animation),
                  HomeSliderCard(
                      title: 'Shop',
                      cardValue: 'Try out the shop',
                      color: Colors.blue,
                      onPressed: (){
                        context.go('/shop');
                      },
                      heroAnimation: animation),
                  HomeSliderCard(
                      title: 'Card 3',
                      cardValue: 'Text text',
                      color: Colors.green,
                      heroAnimation: animation),
                  HomeSliderCard(
                      title: 'Card 4',
                      cardValue: 'Text text',
                      color: Colors.orange,
                      heroAnimation: animation),
                  HomeSliderCard(
                      title: 'Card 5',
                      cardValue: 'Text text',
                      color: Colors.brown,
                      heroAnimation: animation),
                ],
              ),
            ),
          ],
        )),);
  }
}
