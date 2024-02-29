import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/detail/challenge_detail_page.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card_bottom.dart';

import '../../../../../models/challenge/challenge.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/transitions.dart';
import 'challenge_card_top.dart';

class ChallengeCard extends StatefulWidget {
  final Challenge challenge;

  const ChallengeCard({
    super.key,
    required this.challenge,
  });

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: topRightLeftCircularBorder15,
      ),
      child: InkWell(
        child: Column(
          children: [
            ChallengeCardTop(
              image: ImagePaths.fitnessTracker,
              status: widget.challenge.status,
              title: widget.challenge.title,
            ),
            getChallengeCardBottom(
              challenge: widget.challenge,
              showCircularIndicator: false,
            ),
          ],
        ),
        onTap: () {
          Get.to(
            transition: downToUp,
            () => ChallengeDetailPage(
              challenge: widget.challenge,
            ),
          );
        },
      ),
    );
  }
}
