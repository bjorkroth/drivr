import 'package:drivr/data/database_profile_storage.dart';
import 'package:drivr/models/progress_model.dart';
import 'package:drivr/widgets/drivr_app_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';

@JsonSerializable()
class FormData {
  String? name;
  String? passphrase;

  FormData({
    this.name,
    this.passphrase,
  });
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _Login();
}

class _Login extends State<LoginScreen> {
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    void navigateToProfilePage() {
      context.go('/profile');
    }

    void login() async {
      var authProvider = context.read<AuthProvider>();
      var progressProvider = context.read<ProgressModel>();

      if (formData.name!.isEmpty) {
        return;
      }

      var profile = await DatabaseProfileStorage()
          .getProfileByUserName(formData.name ?? "");

      if (profile.id.isNotEmpty) {
        await authProvider.logInUser(profile.id ?? "");

        await progressProvider.updateLocalValues(profile.progressExperience,
            profile.progressLevel);

        navigateToProfilePage();
      }
    }

    return DrivrAppLayout(
      title: "Login",
      child: Form(
        child: Scrollbar(
            child: Column(children: [
          TextFormField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                filled: true, hintText: 'Your name', labelText: 'Name'),
            onChanged: (value) {
              formData.name = value;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration:
                const InputDecoration(filled: true, labelText: 'Passphrase'),
            onChanged: (value) {
              formData.passphrase = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text('Sign in')),
          )
        ])),
      ),
    );
  }
}
