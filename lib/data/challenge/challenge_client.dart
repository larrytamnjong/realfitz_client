import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/challenge/challenge.dart';

import '../../models/category/category.dart';

class ChallengeClient {
  Future<List<Challenge>?> getAvailableChallenges({required String id}) async {
    try {
      final response =
          await http.get(Uri.parse('$getAvailableChallengeUrl$id'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Challenge> challenges = jsonChallenges
            .map((challenge) => Challenge.fromJson(challenge))
            .toList();
        return challenges;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
  Future<List<Challenge>?> getChallengeByCategoryId({required String id, String? categoryId, String? keyword}) async {
    try {
      final response =
          await http.get(Uri.parse('$getChallengeByCategoryIdUrl$id&categoryId=$categoryId&keywords=$keyword'));
      print("bhgkljdfbkgdfk-->"+response.body.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Challenge>? challenges = jsonChallenges
            .map((challenge) => Challenge.fromJson(challenge))
            .toList();
        print("bhgkljdfbkgdfk-->"+challenges.length.toString());
        return challenges;
      }else if(response.statusCode==404){
        return [];
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>?> getChallengeHistories({required String id}) async {
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

  Future<List<Challenge>?> getHistoryChallengeByCategoryId({required String id, String? categoryId, String? keyword}) async {
    try {
      final response =
      await http.get(Uri.parse('$getChallengeHistoriesUrl$id&categoryId=$categoryId&keywords=$keyword'));
      print("bhgkljdfbkgdfk-->"+response.body.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Challenge>? challenges = jsonChallenges
            .map((challenge) => Challenge.fromJson(challenge))
            .toList();
        print("bhgkljdfbkgdfk-->"+challenges.length.toString());
        return challenges;
      }else if(response.statusCode==404){
        return [];
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Category>?> getAllCategories() async {
    try {
      final response =
      await http.get(Uri.parse(getAllCategoryUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonChallenges = jsonDecode(response.body);
        List<Category> challenges =
        jsonChallenges.map((json) => Category.fromJson(json)).toList();
        return challenges;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
