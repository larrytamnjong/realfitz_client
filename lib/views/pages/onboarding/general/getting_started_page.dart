import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Image(
              height: Get.height,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.softLight,
              image: AssetImage(
                ImagePaths.startingStretching,
              ),

            ),
          ),
          Positioned(
            bottom: 0,
            left: 1,right: 1,
            child: Column(
              children: [

                const SizedBox(
                  height: AppSizes.s20,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.walkEarnAndRedeem,
                          style: boldTextStyle.copyWith(fontSize: FontSizes.f25),
                        ),
                        const SizedBox(height: AppSizes.s10),
                        Text(
                          AppStrings.realFitzRewardsYouWIthCoinsForEveryStep,
                          style: regularTextStyle.copyWith(fontSize: FontSizes.f16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSizes.s45),
                        Container(
                          width: Get.width,
                          height: 50,
                          child: PrimaryElevatedButton(
                            text: AppStrings.letsGetStarted,
                            onPressed: () {
                              Get.to(
                                () => const RegistrationPage(),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAnAccount,
                              style: regularTextStyle.copyWith(fontSize: FontSizes.f13),
                            ),
                            PrimaryTextButton(
                                onPressed: () {
                                  Get.to(
                                    transition: downToUp,
                                    () => const LoginPage(),
                                  );
                                },
                                text: AppStrings.login,
                            fontSize: FontSizes.f16,),
                          ],
                        ),
                        const DividerHorizontal(),
                        PrimaryTextButton(
                          decoration: TextDecoration.underline,
                          fontSize: FontSizes.f13,
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
        ],
      ),
    );
  }
}
