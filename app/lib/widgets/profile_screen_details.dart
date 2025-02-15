import 'package:drivr/auth/auth_provider.dart';
import 'package:drivr/data/database_profile_storage.dart';
import 'package:drivr/widgets/loading_progress_indicator.dart';
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
    var authProvider = context.watch<AuthProvider>();
    var progress = context.watch<ProgressModel>();

    Future<ProfileModel> profileFuture =
        DatabaseProfileStorage().getProfileById(authProvider.currentUser);

    return FutureBuilder(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data;

            if (profile == null) return Container();

            return Column(
              children: [
                Text('Profile name ${profile.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Email: ${profile.email}'),
                Text('Current level: ${progress.currentLevel}'),
                Text('Current XP: ${progress.experience} XP'),

              ],
            );
          } else {
            return const LoadingProgressIndicator(
                loadingText: "Loading profile");
          }
        });
  }
}
