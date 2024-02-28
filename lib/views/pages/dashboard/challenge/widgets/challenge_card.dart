import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/detail/challenge_detail_page.dart';

import '../../../../../models/challenge/challenge.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/transitions.dart';
import 'challenge_card_bottom.dart';
import 'challenge_card_top.dart';

class ChallengeCard extends StatelessWidget {
  final String image;
  final String status;
  final String title;
  final String steps;
  final String days;

  const ChallengeCard(
      {super.key,
      required this.image,
      required this.status,
      required this.title,
      required this.steps,
      required this.days});

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
              image: image,
              status: status,
              title: title,
            ),
            ChallengeCardBottom(
              days: days,
              steps: steps,
            )
          ],
        ),
        onTap: () {
          Get.to(
              transition: downToUp,
              () => ChallengeDetailPage(challenge: Challenge()));
        },
      ),
    );
  }
}
