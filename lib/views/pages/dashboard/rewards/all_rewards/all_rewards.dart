import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/widgets/reward_card_summary.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/error.dart';

class AllRewardsPage extends StatefulWidget {
  const AllRewardsPage({super.key});

  @override
  State<AllRewardsPage> createState() => _AllRewardsPageState();
}

class _AllRewardsPageState extends State<AllRewardsPage> {
  late RewardController rewardController;

  @override
  void initState() {
    rewardController = Get.put(RewardController());
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
              rewardController.getAllRewards();
              rewardController.update();
            },
            controller: rewardController.searchController.value,
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: RefreshIndicator(
                onRefresh: rewardController.getAllRewards,
                child: FutureBuilder(
                  future: rewardController.getAllRewards(),
                  builder: (context, result) {
                    if (result.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (result.hasError || result.data == null || result.hasData==false) {
                      return const ErrorPage();
                    }
                    return Obx(
                      () => rewardController.allRewards.isNotEmpty?ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p15, vertical: AppPadding.p16),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: AppPadding.p20,
                        ),
                        itemCount: rewardController.allRewards.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RewardCardSummary(
                            controller: rewardController,
                            showRedeemButton: true,
                            showRandomColor: true,
                            reward: rewardController.allRewards[index],
                            sponsor: rewardController.allRewards[index].sponsor!,
                          );
                        },
                      ):ErrorPage(),
                    );
                  },
                ),
              ),
            ),
        ),
      ],
    )
    ;
  }
}
