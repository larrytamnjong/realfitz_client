import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/participant/challenge_participants.dart';
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

  Future<List<ChallengeParticipants>?> getChallengeParticipants(
      {required String id}) async {
    try {
      final response =
          await http.get(Uri.parse('$getChallengeParticipantsUrl$id'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonParticipants = jsonDecode(response.body);
        List<ChallengeParticipants> participants = jsonParticipants
            .map((participant) => ChallengeParticipants.fromJson(participant))
            .toList();
        return participants;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
