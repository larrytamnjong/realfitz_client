import 'package:flutter/material.dart';
import 'package:realfitzclient/utils/format_date.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/container_header.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/reward/reward.dart';
import '../../../../../models/sponsor/sponsor.dart';
import '../../../../resources/colors_manager.dart';

class RewardDetailPage extends StatelessWidget {
  final Reward reward;
  final Sponsor sponsor;
  const RewardDetailPage(
      {super.key, required this.reward, required this.sponsor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.appName,isCenter: true,),

      body: ListView(
        children: [
          const SizedBox(height: AppSizes.s10),
          const ContainerHeader(title: AppStrings.details),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Text(reward.detail),
          ),
          const SizedBox(height: AppSizes.s10),
          const ContainerHeader(title: AppStrings.howToRedeem),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Text(reward.howToRedeem),
          ),
          const SizedBox(height: AppSizes.s10),
          const ContainerHeader(title: AppStrings.termsAndConditions),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Text(reward.termsAndConditions),
          ),
          const SizedBox(height: AppSizes.s10),
          const ContainerHeader(title: AppStrings.expiryDate),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Text(formatDate(reward.expiryDate)),
          ),
          const SizedBox(height: AppSizes.s10),
          const ContainerHeader(title: AppStrings.sponsor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Text(sponsor.name),
          )
        ],
      ),
    );
  }
}
