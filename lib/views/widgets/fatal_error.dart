import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

import '../../utils/launch_url.dart';
import '../pages/onboarding/general/splash_page.dart';
import '../resources/colors_manager.dart';

class FatalError extends StatelessWidget {
  final String errorMessage;

  const FatalError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    BaseController baseController = Get.put(BaseController());
    return Scaffold(
      appBar: MainAppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const SplashPage());
              },
              icon: const Icon(Icons.refresh))
        ],
        title: AppStrings.error,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image(
                    image: AssetImage(ImagePaths.warning),
                  ),
                  const SizedBox(height: AppSizes.s10),
                  Text(
                    errorMessage,
                    style: regularTextStyle.copyWith(fontSize: FontSizes.f13),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSizes.s30),
                  PrimaryElevatedButton(
                    text: AppStrings.exit,
                    onPressed: () {
                      baseController.exitApp();
                    },
                  ),
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
