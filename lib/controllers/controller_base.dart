import 'package:get/get.dart';

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
}
