import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps.dart';
import 'package:realfitzclient/services/local_storage/local_storage_user.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard.dart';
import 'package:realfitzclient/views/pages/onboarding/getting_started_page.dart';

import '../../views/resources/transitions.dart';

class SplashProcess extends BaseController {
  void doSplashProcesses() async {
    StepController stepController = StepController();
    bool userStoredInLocalStorage =
        await UserLocalStorageManager.isUserStoredInLocalStorage();
    if (userStoredInLocalStorage) {
      await stepController.syncStepData();
      Get.offAll(transition: downToUp, () => const DashboardPage());
    } else {
      Get.offAll(transition: downToUp, () => const GettingStartedPage());
    }
  }
}
