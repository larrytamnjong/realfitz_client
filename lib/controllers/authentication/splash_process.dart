import 'package:get/get.dart';
import 'package:realfitzclient/controllers/controller_base.dart';
import 'package:realfitzclient/services/local_storage/local_storage_user.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard.dart';
import 'package:realfitzclient/views/pages/onboarding/getting_started_page.dart';

import '../../views/resources/transitions.dart';

class SplashProcess extends ControllerBase {
  void doSplashProcesses() async {
    bool userStoredInLocalStorage =
        await UserLocalStorageManager.isUserStoredInLocalStorage();
    if (userStoredInLocalStorage) {
      Get.offAll(transition: downToUp, () => const DashboardPage());
    } else {
      Get.offAll(transition: downToUp, () => const GettingStartedPage());
    }
  }
}
