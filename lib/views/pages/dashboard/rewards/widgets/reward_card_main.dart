import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/reward_detail/reward_detail_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';
import 'package:realfitzclient/views/resources/transitions.dart';

import '../../../../../constants/api_urls.dart';
import '../../../../../constants/strings.dart';
import '../../../../../models/reward/reward.dart';
import '../../../../../models/sponsor/sponsor.dart';
import '../../../../../utils/format_date.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/border_radius.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/buttons.dart';

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
    return Container(
      decoration: BoxDecoration(
          color: AppColors.getRandomColor().withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppBorderRadius.r15)),
      // clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p15),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
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
                style: appNameTextStyle.copyWith(fontSize: FontSizes.f18,color: AppColors.primary),
              ),
              const SizedBox(height: AppSizes.s26),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: AppSizes.s18),
                      Container(
                        // width:Get.width/2.5,
                        height: 35,
                        child: ElevatedButton(

                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStatePropertyAll(AppColors.white),
                            backgroundColor:   MaterialStatePropertyAll(AppColors.primary),
                          ),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: reward.voucherCode),
                            );
                            showInfoSnackBar(message: AppStrings.copiedToClipBoard);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Ionicons.copy_outline,size: 20,),
                              Text(reward.voucherCode,style: regularTextStyle.copyWith(color: AppColors.white),),
                            ],
                          ),
                        ),
                      ),
                        const SizedBox(height: AppSizes.s10),
                        Text(
                          '${AppStrings.claimedOn} ${formatDate(reward.userReward!.creationDate)}',
                          style: regularTextStyle.copyWith(fontSize: FontSizes.f10,),
                        ),
                        Text(
                          '${AppStrings.expiresOn} ${formatDate(reward.expiryDate)}',
                          style: regularTextStyle.copyWith(fontSize: FontSizes.f10),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(width: AppSizes.s10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(width: 45,height: 45,)
                      reward.image!=null? Image.network(networkImageUrl+reward.image.toString(),height: 120,width: 120,):Container()
                    ],
                  )
                ],
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
