import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import 'challenge_completion_status.dart';

class LinearPercentageIndicator extends StatelessWidget {
  final double percent;
  final String stepsTaken;
  final String steps;
  const LinearPercentageIndicator({
    super.key,
    required this.percent,
    required this.stepsTaken,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSizes.s10),
        LinearPercentIndicator(
          barRadius: const Radius.circular(AppBorderRadius.r15),
          progressColor: AppColors.primary,
          animation: true,
          width: MediaQuery.of(context).size.width - 25,
          lineHeight: AppSizes.s20,
          percent: percent,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(IconPaths.shoe),
                size: AppSizes.s40,
              ),
              Text(
                "$stepsTaken/$steps",
                style: semiBoldTextStyle.copyWith(fontSize: FontSizes.f10),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: ChallengeCompletionStatus(percent: percent),
        )
      ],
    );
  }
}
