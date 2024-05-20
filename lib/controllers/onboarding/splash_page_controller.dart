import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps_controller.dart';
import 'package:realfitzclient/services/local_storage/local_storage_service.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard_page.dart';

import '../../constants/strings.dart';
import '../../views/pages/onboarding/authentication/permission_page.dart';
import '../../views/pages/onboarding/general/getting_started_page.dart';
import '../../views/resources/transitions.dart';
import '../../views/widgets/fatal_error.dart';

class SplashPageController extends BaseController {
  final StepController _stepController = StepController();
  bool isFitHealthConnectInstalled = true;

  Future executeProcesses() async {
    try {
      if (Platform.isAndroid) {
        await checkIfFitHealthConnectInstalled();
      }
      if (isFitHealthConnectInstalled) {
        bool isAuthorized = await _stepController.hasPermissions();

        if (isAuthorized) {
          bool isUserInLocalStorage =
              await LocalStorageService.isUserStoredInLocalStorage();
          if (isUserInLocalStorage) {
            await _stepController.startStepSyncProcess();
            Get.offAll(transition: downToUp, () => const DashboardPage());
          } else {
            Get.offAll(transition: downToUp, () => const GettingStartedPage());
          }
        } else {
          Get.offAll(() => const PermissionPage());
        }
      } else {
        Get.offAll(() => const FatalError(
            errorMessage: AppStrings.pleaseInstallGoogleFitHealthConnect));
      }
    } catch (exception) {
      handleException(exception);
      Get.offAll(() => FatalError(errorMessage: exception.toString()));
    }
  }

  Future checkIfFitHealthConnectInstalled() async {
    try {
      isFitHealthConnectInstalled =
          await _stepController.getHealthConnectSdkStatus();
      await AppCheck.checkAvailability("com.google.android.apps.fitness");
    } catch (exception) {
      isFitHealthConnectInstalled = false;
      Get.offAll(() => const FatalError(
          errorMessage: AppStrings.pleaseInstallGoogleFitHealthConnect));
    }
  }
}
