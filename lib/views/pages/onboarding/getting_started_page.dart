import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_parts.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/pages/onboarding/login_page.dart';
import 'package:realfitzclient/views/pages/onboarding/registration_page.dart';
import 'package:realfitzclient/views/styles/text_styles.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../resources/colors_manager.dart';
import '../../resources/transitions.dart';
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
                    height: AppSizes.s20,
                  ),
                  Text(
                    AppStrings.walkEarnAndRedeem,
                    style: boldTextStyle.copyWith(fontSize: FontSizes.f23),
                  ),
                  const SizedBox(height: AppSizes.s10),
                  Text(
                    AppStrings.realFitzRewardsYouWIthCoinsForEveryStep,
                    style: regularTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSizes.s80),
                  PrimaryElevatedButton(
                    text: AppStrings.letsGetStarted,
                    onPressed: () {
                      Get.to(
                        () => const RegistrationPage(),
                      );
                    },
                  ),
                  PrimaryTextButton(
                      onPressed: () {
                        Get.to(
                          transition: downToUp,
                          () => const LoginPage(),
                        );
                      },
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
