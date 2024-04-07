import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/challenge/challenge.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../widgets/error.dart';

class ChallengeParticipantsPage extends StatefulWidget {
  final Challenge challenge;
  const ChallengeParticipantsPage({super.key, required this.challenge});

  @override
  State<ChallengeParticipantsPage> createState() =>
      _ChallengeParticipantsPageState();
}

class _ChallengeParticipantsPageState extends State<ChallengeParticipantsPage> {
  late ChallengeController controller;
  @override
  void initState() {
    controller = Get.put(ChallengeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.participants),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: FutureBuilder(
          future: controller.getChallengeParticipants(
              id: widget.challenge.challengeId),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }
            return ListView.builder(
              itemCount: result.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p5),
                      child: ListTile(
                        tileColor: AppColors.paleLime,
                        leading: Icon(
                          Ionicons.person_circle,
                          color: AppColors.primary,
                        ),
                        title: Text(
                          result.data![index].participantName!,
                          style: regularTextStyle.copyWith(
                            fontSize: FontSizes.f15,
                          ),
                        ),
                        trailing: Text(
                          style: semiBoldTextStyle.copyWith(
                            fontSize: FontSizes.f18,
                          ),
                          "${result.data![index].totalSteps!} ${AppStrings.steps}",
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
