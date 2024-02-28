import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/widgets/challenge_card.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

class AvailableChallenges extends StatefulWidget {
  const AvailableChallenges({super.key});

  @override
  State<AvailableChallenges> createState() => _AvailableChallengesState();
}

class _AvailableChallengesState extends State<AvailableChallenges> {
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
