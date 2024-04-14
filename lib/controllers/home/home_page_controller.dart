import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/controllers/steps/steps_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/data/onboarding/authentication_client.dart';
import 'package:realfitzclient/models/step/StepTarget.dart';
import 'package:realfitzclient/models/step/doughnut_chart_data.dart';
import 'package:realfitzclient/views/pages/onboarding/general/splash_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';
import '../../models/home/home_page_data.dart';
import '../account/account_controller.dart';

class HomePageController extends BaseController {
  final StepController _stepController = StepController();
  final AccountController _accountController = AccountController();
  final UserController _userController = UserController();
  final RewardController _rewardController = RewardController();
  final targetController = TextEditingController();
  final AuthenticationClient _authenticationClient = AuthenticationClient();

  final formKey = GlobalKey<FormBuilderState>();
  Future<HomePageData?> getHomePageData() async {
    try {
      HomePageData homePageData = HomePageData();
      String? todaySteps = await _stepController.getTodaySteps();
      homePageData.name = await _userController.getUserName();
      homePageData.doughnutChartData = await _getDoughnutChartData();
      homePageData.stepsToday = todaySteps;
      homePageData.accountBalance =
          await _accountController.getAccountBalance();
      homePageData.coinsToday = todaySteps;
      homePageData.stepTarget = await _stepController.getUserStepTarget();
      homePageData.caloriesBurned = _calculateCaloriesBurned(todaySteps);
      homePageData.kmWalked = _calculateKilometersWalked(todaySteps);
      homePageData.rewards = await _rewardController.getAllRewards();
      homePageData.adImages = await _authenticationClient.getAdImages();
      return homePageData;
    } catch (exception) {
      handleException(exception);
      return null;
    }
  }

  Future<List<DoughnutChartData>> _getDoughnutChartData() async {
    try {
      List<int?> fiveDayStepData = await _stepController.getFiveDayStepData();
      List<DoughnutChartData> doughnutChartData = [];
      for (var steps in fiveDayStepData) {
        if (steps == null) {
          doughnutChartData.add(DoughnutChartData("0", 0.0));
        } else {
          doughnutChartData.add(
              DoughnutChartData(steps.toDouble().toString(), steps.toDouble()));
        }
      }
      return doughnutChartData;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  updateUserStepTarget() async {
    try {
      if (formKey.currentState!.validate()) {
        showLoadingIndicator();
        StepTarget stepTarget = StepTarget();
        stepTarget.target = targetController.text;
        stepTarget.id = await _userController.getUserId();

        bool isUpdated =
            await _stepController.updateUserStepTarget(stepTarget: stepTarget);
        if (isUpdated) {
          showSuccessSnackBar();
          Get.offAll(() => const SplashPage());
        } else {
          showFailureSnackBar(message: AppStrings.error);
        }
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }

  String _calculateCaloriesBurned(String? steps) {
    if (steps == null) {
      return 0.toString();
    } else {
      const double caloriesPerStep = 0.04;
      double caloriesBurned = int.parse(steps) * caloriesPerStep;
      return caloriesBurned.round().toString();
    }
  }

  String _calculateKilometersWalked(String? steps) {
    if (steps == null) {
      return 0.toString();
    } else {
      const double stepsPerKilometer = 1312.34;
      double kilometersWalked = int.parse(steps) / stepsPerKilometer;
      return kilometersWalked.round().toString();
    }
  }
}
