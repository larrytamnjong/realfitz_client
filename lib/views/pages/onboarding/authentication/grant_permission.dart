import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/controllers/onboarding/grant_permission_controller.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../constants/strings.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles/text_styles.dart';
import '../../../widgets/buttons.dart';

class GrantPermission extends StatefulWidget {
  const GrantPermission({super.key});

  @override
  State<GrantPermission> createState() => _GrantPermissionState();
}

class _GrantPermissionState extends State<GrantPermission> {
  @override
  Widget build(BuildContext context) {
    GrantPermissionController permissionController =
        Get.put(GrantPermissionController());
    return Scaffold(
      appBar: const MainAppBar(
        title: AppStrings.permission,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImagePaths.fitnessTracker)),
              const SizedBox(height: AppSizes.s20),
              Text(
                AppStrings.connectYourAppToGoogleFitOrHealConnect,
                style: regularTextStyle.copyWith(fontSize: FontSizes.f15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.s80),
              LargeGradientButton(
                colors: [AppColors.blue, AppColors.green],
                title: AppStrings.syncHealthDataNow,
                subtitle: AppStrings.connectNow,
                leadingIcon: Icons.security,
                onPressed: () async {
                  await permissionController.requestPermission();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
