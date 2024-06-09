import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/reward/reward.dart';
import 'package:realfitzclient/models/reward/user_reward.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';
import '../../models/category/category.dart';

class RewardClient {

  Future<List<Reward>?> getUserRedeemedRewards({required String id, String? categoryId, String? keyword}) async {
    try {
      print("11111");
      final response =
          await http.get(Uri.parse('$getUserRedeemedRewardsUrl$id&categoryId=$categoryId&keywords=$keyword'));
      print("response---->"+response.body.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonRewards = jsonDecode(response.body);
        List<Reward>? rewards =
            jsonRewards.map((reward) => Reward.fromJson(reward)).toList();
        print("Rewards---->"+rewards.length.toString());
        return rewards;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Reward>?> getAllRewards(
      {required String id, String? categoryId, String? keyword}) async {
    try {
      final response = await http.get(Uri.parse(
          '$getAllRewardsUrl$id&categoryId=$categoryId&keywords=$keyword'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonRewards = jsonDecode(response.body);
        List<Reward> rewards =
            jsonRewards.map((reward) => Reward.fromJson(reward)).toList();
        return rewards;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> addUserReward({required UserReward reward}) async {
    try {
      final response = await http.post(Uri.parse(addUserRewardUrl),
          body: jsonEncode(reward.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        showFailureSnackBar(message: AppStrings.unableToRedeemReward);
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Category>?> getAllCategories() async {
    try {
      final response = await http.get(Uri.parse(getAllCategoryUrl));
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
