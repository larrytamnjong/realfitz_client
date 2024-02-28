import 'package:flutter/material.dart';

import '../../../../../constants/image_paths.dart';
import '../../../../resources/values_manager.dart';
import '../widgets/challenge_card.dart';

class ChallengeHistory extends StatefulWidget {
  const ChallengeHistory({super.key});

  @override
  State<ChallengeHistory> createState() => _ChallengeHistoryState();
}

class _ChallengeHistoryState extends State<ChallengeHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          ChallengeCard(
              image: ImagePaths.fitnessStart,
              status: "status",
              title: "Title",
              steps: "Steps",
              days: "Days")
        ],
      ),
    );
  }
}
