import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../widgets/error.dart';
import '../widgets/challenge_card.dart';

class AvailableChallenges extends StatefulWidget {
  const AvailableChallenges({super.key});

  @override
  State<AvailableChallenges> createState() => _AvailableChallengesState();
}

class _AvailableChallengesState extends State<AvailableChallenges> {
  late ChallengeController controller;
  @override
  void initState() {
    controller = Get.put(ChallengeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: RefreshIndicator(
        onRefresh: () => controller.getAvailableChallenges(),
        child: FutureBuilder(
          future: controller.getAvailableChallenges(),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }
            return Obx(
              () => ListView.builder(
                itemCount: controller.availableChallenges.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChallengeCard(
                    challenge: controller.availableChallenges[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
