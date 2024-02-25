import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/data/step/step_client.dart';

import '../../models/step/last_sync_date.dart';
import '../../models/step/step.dart';
import '../../services/steps/step_service.dart';

class StepController extends BaseController {
  final StepService _stepService = StepService();
  final StepClient _stepClient = StepClient();
  final UserController _userController = UserController();

  startStepSyncProcess() async {
    try {
      DateTime? lastSyncTime = await _getLastSyncDate();

      while (_checkTimeDifference(lastSyncTime!, DateTime.now())) {
        DateTime? getStepsDateTimeEnd = lastSyncTime
            .add(const Duration(hours: 12))
            .subtract(const Duration(seconds: 1));

        await _handleStepsSync(
            startTime: lastSyncTime, endTime: getStepsDateTimeEnd);

        lastSyncTime = getStepsDateTimeEnd.add(const Duration(seconds: 1));
      }
    } catch (exception) {
      handleException(exception);
    }
  }

  Future _handleStepsSync(
      {required DateTime startTime, required DateTime endTime}) async {
    int? steps = await _stepService.getStepsByTimeInterval(
        startTime: startTime, endTime: endTime);
    try {
      if (steps != null) {
        Step stepsObject = Step(steps: steps, syncDate: endTime);
        _syncSteps(steps: stepsObject);
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<DateTime?> _getLastSyncDate() async {
    try {
      int? id = await _userController.getUserId();
      StepLastSyncDate? stepLastSyncDate =
          await _stepClient.getLastSyncDate(id: id!);

      return stepLastSyncDate?.lastSyncDate!;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  void _syncSteps({required Step steps}) async {
    try {
      steps.id = await _userController.getUserId();
      await _stepClient.syncSteps(steps: steps);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<String?> getTodaySteps() async {
    try {
      int? todaySteps = await _stepService.getTodaySteps();
      if (todaySteps != null) {
        return todaySteps.toString();
      }
      return 0.toString();
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<int?>> getFiveDayStepData() async {
    try {
      List<int?> fiveDayStepData = [];
      for (int i = 4; i >= 0; i--) {
        DateTime endTime = DateTime.now().subtract(Duration(days: i));
        DateTime startTime = DateTime(endTime.year, endTime.month, endTime.day);
        int? steps = await _stepService.getStepsByTimeInterval(
            endTime: endTime, startTime: startTime);
        fiveDayStepData.add(steps ?? 100);
      }
      return fiveDayStepData;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> hasPermissions() async {
    try {
      bool? hasPermissions = await _stepService.hasPermissions();
      if (hasPermissions == null) {
        return false;
      }
      return hasPermissions;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> requestAuthorization() async {
    return await _stepService.requestAuthorization();
  }

  bool _checkTimeDifference(DateTime startDateTime, DateTime endDateTime) {
    Duration timeDifference = endDateTime.difference(startDateTime);
    return timeDifference.inHours >= 12;
  }
}
