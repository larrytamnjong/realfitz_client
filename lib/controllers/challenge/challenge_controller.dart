import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/data/challenge/challenge_client.dart';
import 'package:realfitzclient/data/challenge/participation_client.dart';
import 'package:realfitzclient/models/challenge/challenge.dart';
import 'package:realfitzclient/models/participant/participant.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';

class ChallengeController extends BaseController {
  final UserController _userController = UserController();
  final ChallengeClient _challengeClient = ChallengeClient();
  final ParticipationClient _participationClient = ParticipationClient();

  var availableChallenges = [].obs;
  var challengeHistories = [].obs;

  Future<List<Challenge>> getAvailableChallenges() async {
    try {
      int? id = await _userController.getUserId();
      List<Challenge>? challenges =
          await _challengeClient.getAvailableChallenges(id: id!);
      availableChallenges.value = challenges!;
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>> getChallengeHistories() async {
    try {
      int? id = await _userController.getUserId();
      List<Challenge>? challenges =
          await _challengeClient.getChallengeHistories(id: id!);
      challengeHistories.value = challenges!;
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  addChallengeParticipant({required int challengeId}) async {
    try {
      showLoadingIndicator();
      int? id = await _userController.getUserId();
      Participation participation = Participation();
      participation.challengeId = challengeId;
      participation.id = id;
      bool isParticipantAdded = await _participationClient
          .addChallengeParticipant(participation: participation);
      if (isParticipantAdded) {
        List<Challenge>? challenges =
            await _challengeClient.getAvailableChallenges(id: id!);
        availableChallenges.value = challenges!;
        Get.back();
        showSuccessSnackBar();
      } else {
        showFailureSnackBar(message: AppStrings.error);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }
}
