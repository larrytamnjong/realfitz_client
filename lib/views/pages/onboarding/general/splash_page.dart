import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:realfitzclient/controllers/onboarding/splash_page_controller.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SplashPageController splashPageController = Get.put(SplashPageController());
    splashPageController.executeProcesses();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p150),
            child: LoadingIndicator(
              indicatorType: Indicator.lineScalePulseOut,
              colors: [
                AppColors.brightBlue,
                AppColors.primary,
                AppColors.green,
                AppColors.red,
                AppColors.primary
              ],
              strokeWidth: AppSizes.s2,
            ),
          ),
        ),
      ),
    );
  }
}
