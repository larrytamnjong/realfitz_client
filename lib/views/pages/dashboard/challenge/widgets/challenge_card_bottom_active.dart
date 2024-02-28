import 'package:flutter/material.dart';

import 'linear_progress_indicator.dart';

class ChallengeCardActiveBottom extends StatefulWidget {
  const ChallengeCardActiveBottom({super.key});

  @override
  State<ChallengeCardActiveBottom> createState() =>
      _ChallengeCardActiveBottomState();
}

class _ChallengeCardActiveBottomState extends State<ChallengeCardActiveBottom> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LinearPercentageIndicator(
          percent: 1.0,
          stepsTaken: '7000',
          steps: '10000',
        ),
        //RoundedPercentageIndicator(),
      ],
    );
  }
}
