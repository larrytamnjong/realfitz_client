import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/reward_detail/reward_detail_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';
import 'package:realfitzclient/views/resources/transitions.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/reward/reward.dart';
import '../../../../../models/sponsor/sponsor.dart';
import '../../../../../utils/format_date.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class RewardCardMain extends StatelessWidget {
  final Reward reward;
  final Sponsor sponsor;
  const RewardCardMain({
    super.key,
    required this.reward,
    required this.sponsor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.getRandomColor(),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: AppSizes.s30,
                    width: AppSizes.s80,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: circularBorderAll15),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p4),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.appName,
                          style: appNameTextStyle.copyWith(
                              fontSize: FontSizes.f15,
                              color: AppColors.primary),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                sponsor.name,
                style: appNameTextStyle.copyWith(fontSize: FontSizes.f20),
              ),
              const SizedBox(height: AppSizes.s26),
              Text(
                reward.caption,
                style: boldTextStyle.copyWith(fontSize: FontSizes.f13),
              ),
              const SizedBox(height: AppSizes.s5),
              Text(
                reward.detail,
                style: regularTextStyle,
                maxLines: TextLines.l4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: reward.userReward!.rewardVoucherCode));
                      showInfoSnackBar(message: AppStrings.copiedToClipBoard);
                    },
                    child: Row(
                      children: [
                        const Icon(Ionicons.copy_outline),
                        const SizedBox(width: AppSizes.s5),
                        Text(reward.userReward!.rewardVoucherCode),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.s20),
              Text(
                '${AppStrings.claimedOn} ${formatDate(reward.userReward!.creationDate)}',
                style: regularTextStyle,
              ),
              const SizedBox(height: AppSizes.s2),
              Text(
                '${AppStrings.expiresOn} ${formatDate(reward.expiryDate)}',
                style: regularTextStyle,
              ),
              const SizedBox(height: AppSizes.s20),
            ],
          ),
          onTap: () {
            Get.to(
              () => RewardDetailPage(reward: reward, sponsor: sponsor),
              transition: downToUp,
            );
          },
        ),
      ),
    );
  }
}
