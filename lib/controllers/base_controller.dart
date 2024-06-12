import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/strings.dart';

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
    //showFailureSnackBar(message: exception.toString());
    showFailureSnackBar(message: AppStrings.exception);
  }

  void exitApp() {
    SystemNavigator.pop();
  }
}
