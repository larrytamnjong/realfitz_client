import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/detail/challenge_participants_page.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card_top.dart';
import 'package:realfitzclient/views/resources/transitions.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../../../../constants/api_urls.dart';
import '../../../../../constants/image_paths.dart';
import '../../../../../models/challenge/challenge.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../rewards/widgets/reward_card_summary.dart';
import '../widgets/challenge_card_bottom.dart';
import '../widgets/challenge_detail_text.dart';
import '../widgets/count_down_timer.dart';
import '../widgets/floating_status_card.dart';

class ChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetailPage({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    ChallengeController controller = Get.find<ChallengeController>();
    return Scaffold(
      appBar:  MainAppBar(title: challenge.sponsor.name,isLeading: true,),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p15),
        child: ModalProgressHUD(
          inAsyncCall: controller.isShowingLoadingIndicator.value,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p8,
                          vertical: AppPadding.p8
                      ),
                      child: Text(
                        challenge.title,
                        style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
                      ),
                    ),
                    SizedBox(height: AppSizes.s12,),
                    Stack(
                      children: [
                        Container(
                          height: AppSizes.s300,
                          decoration: BoxDecoration(

                            image: DecorationImage(
                              image: //AssetImage(image)
                              NetworkImage(challenge.image != null
                                  ? "$networkImageUrl${challenge.image}"
                                  : ImagePaths.getRandomPath()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: FloatingStatusCard(text: challenge.status),
                        ),
                      ],
                    ),
                  /*  ChallengeCardTop(
                      image: challenge.image != null
                          ? "$networkImageUrl${challenge.image}"
                          : ImagePaths.getRandomPath(),
                      status: challenge.status,
                      title: challenge.title,
                    ),*/
                    getChallengeCardBottom(
                      challenge: challenge,
                      showCircularIndicator: true,
                    ),
                    //const ChallengeCardActiveBottom(),
                    ChallengeDetailText(
                      detail: challenge.detail,
                    ),
                    const SizedBox(height: AppSizes.s10),
                    RewardCardSummary(
                      showRandomColor: true,
                      reward: challenge.reward,
                      sponsor: challenge.sponsor,
                    ),
                  ],
                ),
              ),
              _getChallengeDetailPageBottomAction(controller, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getChallengeDetailPageBottomAction(
      ChallengeController controller, BuildContext context) {
    switch (challenge.status) {
      case 'upcoming':
        return CountDownTimer(
          startDate: DateTime.parse(challenge.startDate),
          onEnd: () {
            controller.getAvailableChallenges();
            Get.back();
          },
        );
      case 'ongoing':
        if (challenge.isParticipating) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: PrimaryElevatedButton(
                color: AppColors.primary,
                text: AppStrings.leaderBoard,
                onPressed: () {
                  Get.to(() => ChallengeParticipantsPage(challenge: challenge),
                      transition: downToUp);
                }),
          );
        } else {
          return PrimaryElevatedButton(

            text: AppStrings.acceptChallenge,
            onPressed: () {
              controller.addChallengeParticipant(
                  challengeId: challenge.challengeId);
            },
          );
        }
      case 'ended':
        return PrimaryElevatedButton(
            text: AppStrings.leaderBoard,
            onPressed: () {
              Get.to(() => ChallengeParticipantsPage(challenge: challenge),
                  transition: downToUp);
            });
      default:
        return PrimaryElevatedButton(text: AppStrings.exit, onPressed: () {});
    }
  }
}
