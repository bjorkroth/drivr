import 'package:flutter/material.dart';

class DrivrAppBar extends PreferredSize{
  const DrivrAppBar({super.key, required super.child, required super.preferredSize});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('drivr'),
        )
      ],
    );
  }
}