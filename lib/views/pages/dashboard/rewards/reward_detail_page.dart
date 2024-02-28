import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/container_header.dart';

import '../../../../constants/strings.dart';
import '../../../resources/colors_manager.dart';

class RewardDetailPage extends StatelessWidget {
  const RewardDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithAppName(),
      backgroundColor: AppColors.palePink,
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ListView(
          children: const [
            SizedBox(height: AppSizes.s10),
            ContainerHeader(title: AppStrings.details),
            Text("Here goes the details of the reward"),
            ContainerHeader(title: AppStrings.howToRedeem),
            Text("Here goes the description on how to redeem"),
            ContainerHeader(title: AppStrings.termsAndConditions),
            Text("Here goes terms and conditions."),
            ContainerHeader(title: AppStrings.expiryDate),
            Text("Here goes expiry date"),
            ContainerHeader(title: AppStrings.sponsor),
            Text("Here goes sponsor")
          ],
        ),
      ),
    );
  }
}
