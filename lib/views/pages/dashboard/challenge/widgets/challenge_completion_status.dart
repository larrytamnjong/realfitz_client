import 'package:flutter/material.dart';
import 'package:realfitzclient/utils/round_percent_two_decimals.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';

class ChallengeCompletionStatus extends StatelessWidget {
  final double percent;
  final double? fontSize;
  const ChallengeCompletionStatus({
    super.key,
    required this.percent,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      percent < 1
          ? "Not completed (${roundToTwoDecimalPlaces(percent)}%)"
          : "Completed (${roundToTwoDecimalPlaces(percent)}%)",
      style: boldTextStyle.copyWith(
          fontSize: fontSize,
          color: percent < 1 ? AppColors.primary : AppColors.green),
    );
  }
}
