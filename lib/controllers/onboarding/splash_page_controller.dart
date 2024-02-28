import 'package:appcheck/appcheck.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps_controller.dart';
import 'package:realfitzclient/services/local_storage/local_storage_service.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard_page.dart';
import 'package:realfitzclient/views/widgets/fatal_error.dart';

import '../../constants/strings.dart';
import '../../views/pages/onboarding/authentication/permission.dart';
import '../../views/pages/onboarding/general/getting_started_page.dart';
import '../../views/resources/transitions.dart';

class SplashPageController extends BaseController {
  final StepController _stepController = StepController();

  void executeProcesses() async {
    try {
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
        Get.offAll(() => const Permission());
      }
    } catch (exception) {
      handleException(exception);
      exitApp();
    } finally {
      isGoogleFitInstalled();
    }
  }

  void isGoogleFitInstalled() async {
    try {
      await AppCheck.checkAvailability("com.google.android.apps.fitness");
    } catch (exception) {
      Get.offAll(() =>
          const FatalError(errorMessage: AppStrings.pleaseInstallGoogleFit));
    }
  }
}
