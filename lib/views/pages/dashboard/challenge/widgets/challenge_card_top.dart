import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/floating_status_card.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class ChallengeCardTop extends StatelessWidget {
  const ChallengeCardTop({
    super.key,
    required this.image,
    required this.status,
    required this.title,
  });

  final String image;
  final String status;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              height: AppSizes.s200,
              decoration: BoxDecoration(
                borderRadius: topRightLeftCircularBorder15,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingStatusCard(text: status),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: AppSizes.s40,
          color: AppColors.black,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p8,
            ),
            child: Text(
              title,
              style: regularTextStyle.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
