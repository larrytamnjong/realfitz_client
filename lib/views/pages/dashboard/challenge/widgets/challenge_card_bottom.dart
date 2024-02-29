import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/rounded_percentage_indicator.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/vertical_text_container.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/challenge/challenge.dart';
import '../../../../../utils/days_calculator.dart';
import '../../../../../utils/get_percentage.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/divider.dart';
import 'linear_progress_indicator.dart';

class ChallengeCardRegularBottom extends StatelessWidget {
  final String days;
  final String steps;
  const ChallengeCardRegularBottom({
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

class ChallengeCardActiveBottom extends StatelessWidget {
  final double percent;
  final String stepsTaken;
  final String steps;
  final bool showCircularIndicator;
  const ChallengeCardActiveBottom(
      {super.key,
      required this.percent,
      required this.stepsTaken,
      required this.steps,
      this.showCircularIndicator = false});

  @override
  Widget build(BuildContext context) {
    return showCircularIndicator
        ? RoundedPercentageIndicator(
            percent: percent, stepsTaken: stepsTaken, steps: steps)
        : LinearPercentageIndicator(
            percent: percent, stepsTaken: stepsTaken, steps: steps);
  }
}

Widget getChallengeCardBottom({
  required Challenge challenge,
  required bool showCircularIndicator,
}) {
  if (challenge.isParticipating) {
    switch (challenge.status) {
      case 'upcoming':
        return ChallengeCardRegularBottom(
          days: getNumberOfDays(challenge.startDate, challenge.endDate),
          steps: challenge.steps.toString(),
        );
      case 'ongoing':
        return ChallengeCardActiveBottom(
            showCircularIndicator: showCircularIndicator,
            percent: getPercentage(challenge.percentageCompleted),
            stepsTaken: challenge.totalStepsTaken!,
            steps: challenge.steps.toString());
      case 'ended':
        return ChallengeCardActiveBottom(
            showCircularIndicator: showCircularIndicator,
            percent: getPercentage(challenge.percentageCompleted),
            stepsTaken: challenge.totalStepsTaken!,
            steps: challenge.steps.toString());
      default:
        return ChallengeCardRegularBottom(
          days: getNumberOfDays(challenge.startDate, challenge.endDate),
          steps: challenge.steps.toString(),
        );
    }
  } else {
    return ChallengeCardRegularBottom(
      days: getNumberOfDays(challenge.startDate, challenge.endDate),
      steps: challenge.steps.toString(),
    );
  }
}
