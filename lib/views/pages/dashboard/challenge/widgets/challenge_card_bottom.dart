import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/vertical_text_container.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/divider.dart';

class ChallengeCardBottom extends StatelessWidget {
  final String days;
  final String steps;
  const ChallengeCardBottom({
    super.key,
    required this.days,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerticalTextContainer(
            topText: AppStrings.totalSteps,
            bottomText: steps,
          ),
          const DividerVertical(),
          VerticalTextContainer(
            topText: AppStrings.days,
            bottomText: days,
          )
        ],
      ),
    );
  }
}
