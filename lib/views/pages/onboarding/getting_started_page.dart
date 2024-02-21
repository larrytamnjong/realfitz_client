import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/image_parts.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/styles/text_styles.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/divider.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(ImagePaths.fitnessStart),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    AppStrings.walkEarnRewardsGetCoins,
                    style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
                  ),
                  const SizedBox(height: AppSize.s10),
                  const Text(
                    AppStrings
                        .realFitzRewardsYouForWalkingEarnCoinsAndUnlockExclusiveDiscounts,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSize.s18),
                  const LineDivider(),
                  Text(
                    AppStrings
                        .byClickingLetsGetStartedStartedOrSigninYouAgreeToOurTermsAndConditions,
                    textAlign: TextAlign.center,
                    style: regularTextStyle.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: AppSize.s50),
                  PrimaryElevatedButton(
                    text: AppStrings.letsGetStarted,
                    onPressed: () {},
                  ),
                  PrimaryTextButton(
                      onPressed: () {},
                      text: AppStrings.alreadyHaveAccountSignIn),
                  const LineDivider(),
                  PrimaryTextButton(
                      decoration: TextDecoration.underline,
                      color: AppColors.brightBlue,
                      onPressed: () {},
                      text: AppStrings.ourTermsAndConditions),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
