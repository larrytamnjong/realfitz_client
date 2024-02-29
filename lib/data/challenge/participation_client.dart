import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/participant/participant.dart';

class ParticipationClient {
  Future<bool> addChallengeParticipant(
      {required Participation participation}) async {
    try {
      final response = await http.post(Uri.parse(addParticipationUrl),
          body: jsonEncode(participation.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
