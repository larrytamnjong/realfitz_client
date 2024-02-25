import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps.dart';
import 'package:realfitzclient/services/local_storage/local_storage_service.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard_page.dart';
import 'package:realfitzclient/views/pages/onboarding/getting_started_page.dart';

import '../../views/resources/transitions.dart';

class SplashPageController extends BaseController {
  void executeProcesses() async {
    StepController stepController = StepController();
    bool isUserInLocalStorage =
        await LocalStorageService.isUserStoredInLocalStorage();
    if (isUserInLocalStorage) {
      await stepController.startupSyncProcess();
      Get.offAll(transition: downToUp, () => const DashboardPage());
    } else {
      Get.offAll(transition: downToUp, () => const GettingStartedPage());
    }
  }
}
