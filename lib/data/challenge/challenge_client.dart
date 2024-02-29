import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/challenge/challenge.dart';

class ChallengeClient {
  Future<List<Challenge>?> getAvailableChallenges({required int id}) async {
    try {
      final response =
          await http.get(Uri.parse('$getAvailableChallengeUrl$id'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Challenge> challenges =
            jsonChallenges.map((json) => Challenge.fromJson(json)).toList();
        return challenges;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>?> getChallengeHistories({required int id}) async {
    try {
      final response =
          await http.get(Uri.parse('$getChallengeHistoriesUrl$id'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Challenge> challenges =
            jsonChallenges.map((json) => Challenge.fromJson(json)).toList();
        return challenges;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
