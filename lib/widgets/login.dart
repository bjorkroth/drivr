import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';
import '../models/profile_model.dart';
import 'drivr_app_bar.dart';
import 'drivr_bottom_bar.dart';

@JsonSerializable()
class FormData{
  String? name;
  String? passphrase;

  FormData({
    this.name,
    this.passphrase,
  });
}
class Login extends StatefulWidget {
  const Login({super.key});

  @override 
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrivrAppBar(preferredSize: const Size.fromHeight(80.0), child: Container(),),
      body: Form(
        child: Scrollbar(
          child: Column(children: [
            TextFormField(
              autofocus: true,
              textInputAction: TextInputAction.next,
               decoration: const InputDecoration(
                filled: true,
                hintText: 'Your name',
                labelText: 'Name'
              ),
              onChanged: (value){
                formData.name = value;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Passphrase'
              ),
              onChanged: (value){
                formData.passphrase = value;
              },
            ),
            TextButton(
            onPressed: () {
              var profileModel = context.read<ProfileModel>();

              if(formData.name!.isEmpty){
                return;
              }

              profileModel.setName(formData.name ?? "");
              profileModel.logInUser();

              context.go('/profile');
            }, 
            child: const Text('Sign in'))
          ])
          )
      ),
      bottomNavigationBar: const DrivrBottomBar(),
    );
  }
}