import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card_top.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../../../../constants/image_paths.dart';
import '../../../../../models/challenge/challenge.dart';
import '../../rewards/widgets/reward_card.dart';
import '../widgets/challenge_card_bottom_active.dart';
import '../widgets/challenge_detail_text.dart';

class ChallengeDetailPage extends StatefulWidget {
  final Challenge challenge;
  const ChallengeDetailPage({super.key, required this.challenge});

  @override
  State<ChallengeDetailPage> createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.challengeDetail),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ChallengeCardTop(
                    image: ImagePaths.fitnessStart,
                    status: "status",
                    title: "Title",
                  ),
                  // const ChallengeCardBottom(
                  //   days: "Days",
                  //   steps: "Steps",
                  // ),
                  const ChallengeCardActiveBottom(),
                  const ChallengeDetailText(
                    detail: "Challenge details",
                  ),
                  const SizedBox(height: AppSizes.s10),
                  const RewardCard(),
                ],
              ),
            ),
            PrimaryElevatedButton(
                text: AppStrings.acceptChallenge, onPressed: () {})
          ],
        ),
      ),
    );
  }
}
