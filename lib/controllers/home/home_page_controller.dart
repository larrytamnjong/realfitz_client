import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/steps/steps_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/models/step/doughnut_chart_data.dart';

import '../../models/home/home_page_data.dart';
import '../account/account_controller.dart';

class HomePageController extends BaseController {
  final StepController _stepController = StepController();
  final AccountController _accountController = AccountController();
  final UserController _userController = UserController();

  Future<HomePageData?> getHomePageData() async {
    try {
      HomePageData homePageData = HomePageData();
      homePageData.name = await _userController.getUserName();
      homePageData.doughnutChartData = await _getDoughnutChartData();
      homePageData.stepsToday = await _stepController.getTodaySteps();
      homePageData.accountBalance =
          await _accountController.getAccountBalance();
      homePageData.coinsToday = await _stepController.getTodaySteps();
      homePageData.stepTarget = await _stepController.getUserStepTarget();
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
          doughnutChartData.add(DoughnutChartData("0", 100.00));
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
}
