import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/reward/reward.dart';

class RewardClient {
  Future<List<Reward>?> getUserRedeemedRewards({required String id}) async {
    try {
      final response =
          await http.get(Uri.parse('$getUserRedeemedRewardsUrl$id'));
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
}
