import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/detail/challenge_detail_page.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card_bottom.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';

import '../../../../../models/challenge/challenge.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/transitions.dart';
import '../../../../resources/values_manager.dart';
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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.palePrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.r15),
             ),
      ),
      child: InkWell(
        child: Column(
          children: [
            ChallengeCardTop(
              image: widget.challenge.image != null
                  ? '$networkImageUrl${widget.challenge.image}'
                  : ImagePaths.getRandomPath(),
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
