import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/data/reward/reward_client.dart';

import '../../models/reward/reward.dart';

class RewardController {
  final UserController _userController = UserController();
  final RewardClient _rewardClient = RewardClient();

  Future<List<Reward>?> getUserRedeemedRewards() async {
    try {
      int? id = await _userController.getUserId();
      List<Reward>? rewards =
          await _rewardClient.getUserRedeemedRewards(id: id!);
      return rewards;
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
