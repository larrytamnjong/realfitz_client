import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/utils/launch_url.dart';
import 'package:realfitzclient/views/pages/onboarding/authentication/login_page.dart';
import 'package:realfitzclient/views/pages/onboarding/authentication/registration_page.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/styles/text_styles.dart';
import '../../../resources/transitions.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/divider.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                colorBlendMode: BlendMode.difference,
                image: AssetImage(
                  ImagePaths.manWomanStretching,
                ),
              ),
              const SizedBox(
                height: AppSizes.s20,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      const SizedBox(height: AppSizes.s45),
                      PrimaryElevatedButton(
                        text: AppStrings.letsGetStarted,
                        onPressed: () {
                          Get.to(
                            () => const RegistrationPage(),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAnAccount,
                            style: regularTextStyle,
                          ),
                          PrimaryTextButton(
                              onPressed: () {
                                Get.to(
                                  transition: downToUp,
                                  () => const LoginPage(),
                                );
                              },
                              text: AppStrings.signIn),
                        ],
                      ),
                      const DividerHorizontal(),
                      PrimaryTextButton(
                        decoration: TextDecoration.underline,
                        color: AppColors.brightBlue,
                        onPressed: () async {
                          launchExternalUrl(
                            urlString:
                                'https://realfitz.org/terms-and-conditions/',
                          );
                        },
                        text: AppStrings.ourTermsAndConditions,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
