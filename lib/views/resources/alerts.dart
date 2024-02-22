import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../constants/strings.dart';

void showSuccessSnackBar() {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: AppColors.whatsAppGreen,
      title: AppStrings.alert,
      message: AppStrings.successful,
      icon: Icon(
        Icons.check,
        size: AppSizes.s30,
        color: AppColors.white,
      ),
      duration: const Duration(seconds: DurationConstant.d2),
    ),
  );
}

void showFailureSnackBar({required String message}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: AppColors.red,
      title: AppStrings.alert,
      message: message,
      icon: Icon(Icons.warning, color: AppColors.white, size: AppSizes.s30),
      duration: const Duration(seconds: DurationConstant.d2),
    ),
  );
}
