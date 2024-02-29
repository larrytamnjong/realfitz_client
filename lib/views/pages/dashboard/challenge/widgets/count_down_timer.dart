import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class CountDownTimer extends StatelessWidget {
  final DateTime startDate;
  final Function()? onEnd;
  const CountDownTimer({
    super.key,
    required this.startDate,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: AppSizes.s60,
      color: AppColors.palePrimary,
      child: Align(
        alignment: Alignment.center,
        child: TimerCountdown(
            colonsTextStyle:
                regularTextStyle.copyWith(color: AppColors.primary),
            descriptionTextStyle:
                boldTextStyle.copyWith(color: AppColors.primary),
            timeTextStyle: boldTextStyle.copyWith(
                fontSize: FontSizes.f18, color: AppColors.primary),
            format: CountDownTimerFormat.daysHoursMinutesSeconds,
            endTime: startDate,
            onEnd: onEnd),
      ),
    );
  }
}
