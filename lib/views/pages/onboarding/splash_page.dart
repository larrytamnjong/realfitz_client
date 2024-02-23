import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:realfitzclient/controllers/authentication/splash_process.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashProcess splashPageProcess;
  @override
  void initState() {
    splashPageProcess = Get.put(SplashProcess());
    splashPageProcess.doSplashProcesses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                AppColors.whatsAppGreen,
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
