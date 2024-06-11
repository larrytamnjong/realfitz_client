import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/data/challenge/challenge_client.dart';
import 'package:realfitzclient/data/challenge/participation_client.dart';
import 'package:realfitzclient/models/category/category.dart';
import 'package:realfitzclient/models/challenge/challenge.dart';
import 'package:realfitzclient/models/participant/challenge_participants.dart';
import 'package:realfitzclient/models/participant/participant.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';

class ChallengeController extends BaseController {
  final UserController _userController = UserController();
  final ChallengeClient _challengeClient = ChallengeClient();
  final ParticipationClient _participationClient = ParticipationClient();
  Rx<TextEditingController> searchController = TextEditingController().obs;

  var availableChallenges = [].obs;
  var filterAvailableChallenges = [].obs;
  var challengeHistories = [].obs;
  var categories = [].obs;

  Rx<Category> selectedCategoryChallenge = Category(id: "0").obs;

  Future<List<Challenge>> getAvailableChallenges() async {
    try {
      String? id = await _userController.getUserId();
      List<Challenge>? challenges =
          await _challengeClient.getAvailableChallenges(id: id!);

      availableChallenges.value = challenges!;
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>?> getChallengesByCategoryId() async {
    try {
      String? id = await _userController.getUserId();
      print("id--->" + id.toString());
      print("selectedCategoryChallenge--->" +
          selectedCategoryChallenge.value.id.toString());
      print("searchController--->" + searchController.value.text.trim());
      List<Challenge>? challenges =
          await _challengeClient.getChallengeByCategoryId(
              id: id!,
              categoryId: selectedCategoryChallenge.value.id ?? "",
              keyword: searchController.value.text ?? "");

      print("idfghjoijf--->" + challenges!.length.toString());
      filterAvailableChallenges.value = challenges;
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>> getChallengeHistories() async {
    try {
      String? id = await _userController.getUserId();
      List<Challenge>? challenges =
          await _challengeClient.getChallengeHistories(id: id!);
      challengeHistories.value = challenges!;
      print("challengeHistories.length--->" +
          challengeHistories.length.toString());
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Challenge>?> getChallengeHistoriesById() async {
    try {
      String? id = await _userController.getUserId();
      List<Challenge>? challenges =
          await _challengeClient.getHistoryChallengeByCategoryId(
              id: id!,
              categoryId: selectedCategoryChallenge.value.id ?? "",
              keyword: searchController.value.text ?? "");
      challengeHistories.value = challenges!;
      print("challengeHistories.length111--->" +
          challengeHistories.length.toString());
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      List<Category>? challenges = await _challengeClient.getAllCategories();
      Category cat = Category(id: "0", name: "All", image: "");
      categories.value = challenges!;

      if (challenges.isNotEmpty) {
        categories.insert(0, cat);
      }
      selectedCategoryChallenge.value = cat;
      update();
      print("Categories.length--->" + categories.length.toString());
      print("challenges.length--->" + challenges.toString());
      return challenges;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<ChallengeParticipants>?> getChallengeParticipants(
      {required String id}) async {
    try {
      List<ChallengeParticipants>? participants =
          await _participationClient.getChallengeParticipants(id: id);
      return participants;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  addChallengeParticipant({required String challengeId}) async {
    try {
      showLoadingIndicator();
      String? id = await _userController.getUserId();
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
