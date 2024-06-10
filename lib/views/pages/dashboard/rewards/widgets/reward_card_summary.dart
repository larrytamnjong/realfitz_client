import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/reward_detail/reward_detail_page.dart';
import 'package:realfitzclient/views/resources/transitions.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../../../../constants/api_urls.dart';
import '../../../../../constants/image_paths.dart';
import '../../../../../constants/strings.dart';
import '../../../../../models/reward/reward.dart';
import '../../../../../models/sponsor/sponsor.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class RewardCardSummary extends StatelessWidget {
  final bool showRandomColor;
  final bool showRedeemButton;
  final Reward reward;
  final Sponsor sponsor;
  final RewardController? controller;

  const RewardCardSummary({
    super.key,
    required this.reward,
    required this.sponsor,
    this.showRandomColor = false,
    this.controller,
    this.showRedeemButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
      decoration: BoxDecoration(
          color: showRandomColor
              ? AppColors.getRandomColor().withOpacity(0.5)
              : AppColors.paleLime,
          borderRadius: circularBorderAll15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppPadding.p15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reward.image.toString() != "" ||
                          reward.image.toString() != "null"
                      ? Image(
                          image: NetworkImage(
                              '$networkImageUrl${reward.image.toString()}'),
                          height: AppSizes.s100,
                          width: AppSizes.s100,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          image: AssetImage(ImagePaths.logo),
                          height: AppSizes.s100,
                          width: AppSizes.s100,
                          fit: BoxFit.cover,
                        ),
                  Container(width: AppSizes.s20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        // Add a title widget
                        Text(
                          reward.caption,
                          style:
                              boldTextStyle.copyWith(fontSize: FontSizes.f13),
                        ),

                        Container(height: AppSizes.s5),
                        // Add a subtitle widget
                        Text(
                          reward.detail,
                          style: semiBoldTextStyle,
                          maxLines: TextLines.l4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Container(height: AppSizes.s10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            reward.isUserRedeemable
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p10, bottom: AppPadding.p16),
                    child: Center(
                      child: showRedeemButton
                          ? PrimaryElevatedButton(
                              text: AppStrings.redeem,
                              onPressed: () async {
                                await controller?.addUserReward(
                                    rewardId: reward.id);
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        onTap: () {
          Get.to(
            transition: downToUp,
            () => RewardDetailPage(
              sponsor: sponsor,
              reward: reward,
            ),
          );
        },
      ),
    );
  }
}
