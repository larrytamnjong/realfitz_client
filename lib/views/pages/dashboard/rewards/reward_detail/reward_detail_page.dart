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
      appBar: const AppBarWithAppName(),
      backgroundColor: AppColors.paleLime,
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ListView(
          children: [
            const SizedBox(height: AppSizes.s10),
            const ContainerHeader(title: AppStrings.details),
            Text(reward.detail),
            const ContainerHeader(title: AppStrings.howToRedeem),
            Text(reward.howToRedeem),
            const ContainerHeader(title: AppStrings.termsAndConditions),
            Text(reward.termsAndConditions),
            const ContainerHeader(title: AppStrings.expiryDate),
            Text(formatDate(reward.expiryDate)),
            const ContainerHeader(title: AppStrings.sponsor),
            Text(sponsor.name)
          ],
        ),
      ),
    );
  }
}
