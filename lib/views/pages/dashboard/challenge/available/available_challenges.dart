import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/styles/text_styles.dart';
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
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p15, vertical: AppPadding.p8),
          child: TextField(
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                hintStyle: hintTextStyle,
                labelText: AppStrings.search),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              controller.getChallengesByCategoryId();
              controller.update();
            },
            controller: controller.searchController.value,
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: /*controller.selectedCategoryChallenge.value.id != "0"
                ? */
                  RefreshIndicator(
                onRefresh: () => controller.getChallengesByCategoryId(),
                child: FutureBuilder(
                  future: controller.getChallengesByCategoryId(),
                  builder: (context, result) {
                    if (result.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (result.hasError ||
                        result.data == null ||
                        result.hasData == false) {
                      return const ErrorPage();
                    }
                    return Obx(
                        () => controller.filterAvailableChallenges.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15,
                                    vertical: AppPadding.p10),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: AppPadding.p20,
                                ),
                                itemCount: controller
                                    .filterAvailableChallenges.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return ChallengeCard(
                                    challenge: controller
                                        .filterAvailableChallenges[index],
                                  );
                                },
                              )
                            : const ErrorPage());
                  },
                ),
              )
              /*   : RefreshIndicator(
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
                          () => ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p15, vertical: AppPadding.p16),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: AppPadding.p20,
                            ),
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
                  ),*/
              ),
        ),
      ],
    );
  }
}
