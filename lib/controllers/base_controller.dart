import 'package:flutter/services.dart';
import 'package:get/get.dart';

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

  void exitApp() {
    SystemNavigator.pop();
  }
}
