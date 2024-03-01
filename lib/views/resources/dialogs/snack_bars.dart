import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../constants/strings.dart';

void showSuccessSnackBar() {
  Get.snackbar(
    colorText: AppColors.white,
    AppStrings.alert,
    AppStrings.successful,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.green,
    icon: Icon(
      Icons.check,
      size: AppSizes.s30,
      color: AppColors.white,
    ),
    duration: const Duration(seconds: DurationConstant.d2),
  );
}

void showFailureSnackBar({required String message}) {
  Get.snackbar(
    colorText: AppColors.white,
    AppStrings.alert,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.red,
    icon: Icon(Icons.warning, color: AppColors.white, size: AppSizes.s30),
    duration: const Duration(seconds: DurationConstant.d2),
  );
}

void showInfoSnackBar({required String message}) {
  Get.snackbar('Info', message, snackPosition: SnackPosition.BOTTOM);
}
