import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import 'challenge_completion_status.dart';

class RoundedPercentageIndicator extends StatelessWidget {
  final double percent;
  final String stepsTaken;
  final String steps;
  const RoundedPercentageIndicator({
    super.key,
    required this.percent,
    required this.stepsTaken,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: CircularPercentIndicator(
        radius: AppSizes.s70,
        lineWidth: AppSizes.s12,
        animation: true,
        percent: percent,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(IconPaths.shoe),
              size: AppSizes.s40,
            ),
            Text(
              "$stepsTaken/$steps",
              style: semiBoldTextStyle,
            ),
          ],
        ),
        footer: ChallengeCompletionStatus(
            percent: percent, fontSize: FontSizes.f16),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: AppColors.primary,
      ),
    );
  }
}
