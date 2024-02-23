import 'package:flutter/cupertino.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/data/steps/step.dart';

import '../../models/step/last_sync_date.dart';
import '../../services/steps/steps.dart';

class StepController extends BaseController {
  syncStepData() async {
    StepService stepService = StepService();
    StepClient stepsClient = StepClient();

    bool isAccessStepsDataAuthorized =
        await stepService.accessStepDataAuthorization();
    DateTime? lastSyncTime = await getLastSyncDate(stepClient: stepsClient);
    DateTime? getStepsDateTimeEnd =
        lastSyncTime?.add(const Duration(hours: 12));

    bool isTimeDifferenceGreaterThan12Hours =
        checkIfTimeDifferenceIsGreaterThan12Hours(
            lastSyncTime!, DateTime.now());

    while (isTimeDifferenceGreaterThan12Hours == true) {
      try {
        if (isAccessStepsDataAuthorized) {
          await processSync(
              stepService: stepService,
              startTime: lastSyncTime!,
              endTime: getStepsDateTimeEnd!);

          lastSyncTime = getStepsDateTimeEnd;

          getStepsDateTimeEnd = lastSyncTime.add(const Duration(hours: 12));
          isTimeDifferenceGreaterThan12Hours =
              checkIfTimeDifferenceIsGreaterThan12Hours(
                  lastSyncTime, DateTime.now());
        }
      } catch (exception) {
        handleException(exception);
      }
    }
  }

  Future processSync(
      {required StepService stepService,
      required DateTime startTime,
      required DateTime endTime}) async {
    int? steps = await stepService.getStepsByInterval(
        startTime: startTime, endTime: endTime);

    if (steps != null) {
      debugPrint(steps.toString());
    }
  }

  Future<DateTime?> getLastSyncDate({required StepClient stepClient}) async {
    int? id = await getUserId();
    StepLastSyncDate? stepLastSyncDate =
        await stepClient.getLastSyncDate(id: id!);
    return stepLastSyncDate?.lastSyncDate!;
  }

  bool checkIfTimeDifferenceIsGreaterThan12Hours(
      DateTime startDateTime, DateTime endDateTime) {
    Duration timeDifference = endDateTime.difference(startDateTime);
    return timeDifference.inHours >= 12;
  }
}
