import 'package:get/get.dart';
import 'package:realfitzclient/services/local_storage/local_storage_user.dart';

import '../views/resources/alerts.dart';

class ControllerBase extends GetxController {
  var isShowingLoadingIndicator = false.obs;

  void showLoadingIndicator() {
    isShowingLoadingIndicator.value = true;
  }

  void hideLoadingIndicator() {
    isShowingLoadingIndicator.value = false;
  }

  void handleException(exception) {
    hideLoadingIndicator();
    showFailureSnackBar(message: exception.toString());
  }

  Future<int?> getUserId() async {
    return await UserLocalStorageManager.getUserIdFromLocalStorage();
  }
}
