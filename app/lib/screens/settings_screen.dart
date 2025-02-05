import 'package:flutter/material.dart';
import '../widgets/drivr_app_bar.dart';
import '../widgets/drivr_bottom_bar.dart';
import '../widgets/drivr_drawer_menu.dart';
import '../data/settings_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  late Future<Map<String, String>> _settings;

  @override
  void initState() {
    super.initState();
    _settings = SettingsData().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrivrAppBar(
          title: 'Settings',
          preferredSize: const Size.fromHeight(80.0),
          child: Container()),
      drawer: const DrivrDrawerMenu(),
      body: Center(
          child: Column(
        children: [
          const Icon(
            Icons.settings,
            size: 150,
          ),
          FutureBuilder<Map<String, String>>(
              future: _settings,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var listOfSettingsValues = <Widget>[];
                  var data = snapshot.data;
                  data?.forEach((key, value) {
                    listOfSettingsValues.add(Text("$key: $value"));
                  });
                  return Column(children: listOfSettingsValues);
                }

                return const Column(children: [
                  CircularProgressIndicator(),
                  Text('Loading settings')
                ]);
              })
        ],
      )),
      bottomNavigationBar: DrivrBottomBar(menuBarSelectedItem: 2),
    );
  }
}
