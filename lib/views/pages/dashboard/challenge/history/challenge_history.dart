import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/challenge/challenge_controller.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
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
    controller.searchController.value.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                controller.getChallengeHistoriesById();
                controller.update();
              },
              controller: controller.searchController.value,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child:
              /*controller.selectedCategoryChallenge.value.id.toString() != "0"
                    ? */
              RefreshIndicator(
                  onRefresh: () => controller.getChallengeHistoriesById(),
                  child: FutureBuilder(
                    future: controller.getChallengeHistoriesById(),
                    builder: (context, result) {
                      if (result.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (result.hasError || result.data == null || result.hasData == false) {
                        return const ErrorPage();
                      }
                      return Obx(()=>
                  controller.challengeHistories.isNotEmpty?
                                  ListView.separated(
                                    shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p15, vertical: AppPadding.p16),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: AppPadding.p20,
                            ),
                            itemCount: controller.challengeHistories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ChallengeCard(
                                challenge:
                                controller.challengeHistories[index],
                              );
                            },
                          ): ErrorPage(),
                      );

                    },
                  ),
                )
                   /* : RefreshIndicator(
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
                        () => ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p15, vertical: AppPadding.p16),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: AppPadding.p20,
                          ),
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
                ),*/

            ),
          ),
        ],
      ),
    );
  }
}
