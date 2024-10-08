import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/controllers/onboarding/grant_permission_controller.dart';
import 'package:realfitzclient/views/pages/onboarding/general/splash_page.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../constants/strings.dart';
import '../../../../utils/launch_url.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles/text_styles.dart';
import '../../../widgets/buttons.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    PermissionController permissionController = Get.put(PermissionController());
    return Scaffold(
      appBar: const MainAppBar(
        title: AppStrings.permission,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image(image: AssetImage(ImagePaths.fitnessTracker)),
                  const SizedBox(height: AppSizes.s20),
                  Text(
                    AppStrings.connectYourAppToGoogleFitOrHealConnect,
                    style: regularTextStyle.copyWith(fontSize: FontSizes.f15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSizes.s60),
                  LargeGradientButton(
                    colors: [AppColors.blue, AppColors.green],
                    title: AppStrings.syncHealthDataNow,
                    subtitle: AppStrings.connectNow,
                    leadingIcon: Icons.security,
                    onPressed: () async {
                      await permissionController.requestPermission();
                    },
                  ),
                  const SizedBox(height: AppSizes.s10),
                  PrimaryTextButton(
                    onPressed: () {
                      Get.offAll(() => const SplashPage());
                    },
                    text: AppStrings.restartApp,
                  )
                ],
              ),
            ),
            PrimaryTextButton(
              decoration: TextDecoration.underline,
              color: AppColors.brightBlue,
              onPressed: () async {
                launchExternalUrl(
                  urlString: 'https://realfitz.org/terms-and-conditions/',
                );
              },
              text: AppStrings.ourTermsAndConditions,
            ),
          ],
        ),
      ),
    );
  }
}
