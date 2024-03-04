import 'package:flutter/material.dart';
import 'package:realfitzclient/utils/get_percentage.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../challenge/widgets/linear_progress_indicator.dart';
import 'horizontal_text_icon_button.dart';

class DailyTarget extends StatelessWidget {
  final String percent;
  final String stepsTaken;
  final String steps;
  const DailyTarget({
    super.key,
    required this.percent,
    required this.stepsTaken,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalTextIconButton(
          icon: ImageIcon(
            AssetImage(IconPaths.edit),
            size: AppSizes.s20,
            color: AppColors.primary,
          ),
          text: AppStrings.dailyStepTarget,
          onPressed: () {},
        ),
        LinearPercentageIndicator(
          negativeWidth: 40,
          percent: getPercentageOnTen(percent),
          stepsTaken: stepsTaken,
          steps: steps,
        ),
      ],
    );
  }
}
