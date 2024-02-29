import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';

import '../../../../resources/values_manager.dart';
import '../../../../widgets/error.dart';
import '../widgets/challenge_card.dart';

class ChallengeHistory extends StatefulWidget {
  const ChallengeHistory({super.key});

  @override
  State<ChallengeHistory> createState() => _ChallengeHistoryState();
}

class _ChallengeHistoryState extends State<ChallengeHistory> {
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
        onRefresh: () => controller.getChallengeHistories(),
        child: FutureBuilder(
          future: controller.getChallengeHistories(),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }
            return Obx(
              () => ListView.builder(
                itemCount: controller.challengeHistories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChallengeCard(
                    challenge: controller.challengeHistories[index],
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
