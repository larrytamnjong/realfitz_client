import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card_top.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../../../../constants/image_paths.dart';
import '../../../../../models/challenge/challenge.dart';
import '../../rewards/widgets/reward_card.dart';
import '../widgets/challenge_card_bottom.dart';
import '../widgets/challenge_detail_text.dart';
import '../widgets/challenge_page_bottom_information.dart';

class ChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetailPage({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    ChallengeController controller = Get.find<ChallengeController>();
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.challengeDetail),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ModalProgressHUD(
          inAsyncCall: controller.isShowingLoadingIndicator.value,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ChallengeCardTop(
                      image: ImagePaths.fitnessStart,
                      status: challenge.status,
                      title: challenge.title,
                    ),
                    getChallengeCardBottom(
                      challenge: challenge,
                      showCircularIndicator: true,
                    ),
                    //const ChallengeCardActiveBottom(),
                    ChallengeDetailText(
                      detail: challenge.detail,
                    ),
                    const SizedBox(height: AppSizes.s10),
                    RewardCard(
                      reward: challenge.reward,
                      sponsor: challenge.sponsor,
                    ),
                  ],
                ),
              ),
              _getChallengeDetailPageBottomAction(controller)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getChallengeDetailPageBottomAction(ChallengeController controller) {
    switch (challenge.status) {
      case 'upcoming':
        return ChallengeDetailPageBottomInformation(
            text: 'Starts on ${challenge.daysToStart}');
      case 'ongoing':
        if (challenge.isParticipating) {
          return const ChallengeDetailPageBottomInformation(
              text: AppStrings.youAreParticipatingInThisContest);
        } else {
          return PrimaryElevatedButton(
              text: AppStrings.acceptChallenge,
              onPressed: () {
                controller.addParticipation(challengeId: challenge.challengeId);
              });
        }
      case 'ended':
        return const ChallengeDetailPageBottomInformation(
            text: AppStrings.challengeHasEnded);
      default:
        return const ChallengeDetailPageBottomInformation(
            text: AppStrings.error);
    }
  }
}
