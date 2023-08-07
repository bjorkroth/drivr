import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/profile_model.dart';

class CreateLocalProfileFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localFile async {
    final path = await _localPath;
    return '$path/profile_data.json';
  }

  Future<void> createLocalProfileFileIfNotExist() async{
    var filepath = await _localFile;

    if(await File(filepath).exists()) return;

    File(filepath).create();
    var jsonMap = jsonEncode(
        ProfileModel.create("temp", "temp", 0, 1).toJson()
    );
    await File(filepath).writeAsString(jsonMap, mode: FileMode.write);
  }
}