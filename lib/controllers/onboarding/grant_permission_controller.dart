import 'dart:io';

import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps_controller.dart';
import 'package:realfitzclient/views/pages/onboarding/general/splash_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';

class PermissionController extends BaseController {
  final StepController _stepController = StepController();

  Future requestPermission() async {
    try {
      bool isAuthorized = await _stepController.requestAuthorization();
      if (isAuthorized) {
        Get.offAll(() => const SplashPage());
      } else {
        if (Platform.isAndroid) {
          showFailureSnackBar(
              message: AppStrings.pleaseGrantAuthorizationOnHealthConnect);
        } else {
          showFailureSnackBar(message: AppStrings.failedToGrantAuthorization);
        }
      }
    } catch (exception) {
      handleException(exception);
    }
  }
}
