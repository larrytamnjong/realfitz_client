import 'package:get/get.dart';
import 'package:realfitzclient/services/local_storage/local_storage_service.dart';

import '../views/resources/dialogs/snack_bars.dart';

class BaseController extends GetxController {
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
    return await LocalStorageService.getUserIdFromLocalStorage();
  }
}
