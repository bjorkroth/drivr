import 'package:drivr/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';

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
            }, 
            child: const Text('Sign in'))
          ])
          )
      )
    );
  }
}