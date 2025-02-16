import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../models/mission_model.dart';

class MissionStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localFile async {
    final path = await _localPath;
    return '$path/missions.json';
  }

  static const String apiUrl =
      "https://api-drivr-test-bgebb6bqa5caa7fn.swedencentral-01.azurewebsites.net";

  Future<List<MissionModel>> readMissions() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/missions'));

      List<MissionModel> missions = [];
      if (response.statusCode == 200) {
        List<dynamic> data = await json.decode(response.body);

        for (var element in data) {
          missions.add(MissionModel.fromJson(element as Map<String, dynamic>));
        }
      }

      return missions;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future<MissionModel> getMissionById(int missionId, String userId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/missions/$missionId/user/$userId'));

      if (response.statusCode != 200) {
        throw Exception("Could not get mission ");
      }

      dynamic data = await json.decode(response.body);
      return MissionModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Could not get mission");
    }
  }

  Future<void> postAccomplishMission(int missionId, String userId) async {
    try {
      final response = await http.post(
          Uri.parse('$apiUrl/missions/$missionId/user/$userId/accomplish'));

      if (response.statusCode != 200) {
        throw Exception("Could not accomplish mission");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> postQuestionAnswer(int missionId, int questionId, String userId, bool isCorrect, String answer) async {
    try {
      var body = jsonEncode({
        "isCorrect": isCorrect,
        "answer": answer
      });
      final response = await http.post(
          Uri.parse('$apiUrl/missions/$missionId/question/$questionId/user/$userId/answer'),body: body);

      if (response.statusCode != 201) {
        throw Exception("Could not accomplish mission");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> writeMissions(List<MissionModel> missions) async {
    final filepath = await _localFile;
    var file = File(filepath);

    var jsonMap = [];
    for (var mission in missions) {
      jsonMap.add(mission.toJson());
    }
    var json = jsonEncode(jsonMap);

    await file.writeAsString(json);
    return;
  }
}
