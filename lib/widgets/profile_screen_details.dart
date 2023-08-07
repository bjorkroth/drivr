import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/profile_model.dart';
import '../models/progress_model.dart';

class ProfileScreenDetails extends StatefulWidget {
  const ProfileScreenDetails({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenDetails();
}

class _ProfileScreenDetails extends State<ProfileScreenDetails> {
  @override
  Widget build(BuildContext context) {
    var profile = context.watch<ProfileModel>();
    var progress = context.watch<ProgressModel>();

    return Column(
      children: [
        Text('Profile name ${profile.name}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('Current level: ${progress.currentLevel}'),
        Text('Current XP: ${progress.experience} XP')
      ],
    );
  }
}
