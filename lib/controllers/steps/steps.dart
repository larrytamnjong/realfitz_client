import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/data/step/step.dart';

import '../../models/step/last_sync_date.dart';
import '../../models/step/step.dart';
import '../../services/steps/steps.dart';

class StepController extends BaseController {
  StepService stepService = StepService();
  StepClient stepClient = StepClient();

  startupSyncProcess() async {
    try {
      bool isAuthorized = await stepService.requestAuthorization();
      DateTime? lastSyncTime = await _getLastSyncDate();

      while (_checkTimeDifference(lastSyncTime!, DateTime.now())) {
        if (isAuthorized) {
          DateTime? getStepsDateTimeEnd = lastSyncTime
              .add(const Duration(hours: 12))
              .subtract(const Duration(seconds: 1));

          await _handleStepsSync(
              startTime: lastSyncTime, endTime: getStepsDateTimeEnd);

          lastSyncTime = getStepsDateTimeEnd.add(const Duration(seconds: 1));
        }
      }
    } catch (exception) {
      handleException(exception);
    }
  }

  Future _handleStepsSync(
      {required DateTime startTime, required DateTime endTime}) async {
    int? steps = await stepService.getStepsByInterval(
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
      int? id = await getUserId();
      StepLastSyncDate? stepLastSyncDate =
          await stepClient.getLastSyncDate(id: id!);

      return stepLastSyncDate?.lastSyncDate!;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  void _syncSteps({required Step steps}) async {
    try {
      steps.id = await getUserId();
      await stepClient.syncSteps(steps: steps);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  bool _checkTimeDifference(DateTime startDateTime, DateTime endDateTime) {
    Duration timeDifference = endDateTime.difference(startDateTime);
    return timeDifference.inHours >= 12;
  }
}
