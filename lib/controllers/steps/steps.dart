import 'package:flutter/cupertino.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/data/steps/step.dart';

import '../../models/step/last_sync_date.dart';
import '../../services/steps/steps.dart';

class StepsController extends BaseController {
  syncStepsData() async {
    StepsService stepsService = StepsService();
    StepsClient stepsClient = StepsClient();

    DateTime? lastSyncTime = await getLastSyncDate(stepsClient: stepsClient);
    DateTime? getStepsDateTimeEnd =
        lastSyncTime?.add(const Duration(hours: 12));

    bool isTimeDifferenceGreaterThan12Hours =
        checkIfTimeDifferenceIsGreaterThan12Hours(
            lastSyncTime!, DateTime.now());

    while (isTimeDifferenceGreaterThan12Hours == true) {
      try {
        await processSync(
            stepsService: stepsService,
            startTime: lastSyncTime!,
            endTime: getStepsDateTimeEnd!);

        lastSyncTime = getStepsDateTimeEnd;

        getStepsDateTimeEnd = lastSyncTime.add(const Duration(hours: 12));
        isTimeDifferenceGreaterThan12Hours =
            checkIfTimeDifferenceIsGreaterThan12Hours(
                lastSyncTime, DateTime.now());
      } catch (exception) {
        handleException(exception);
      }
    }
  }

  Future processSync(
      {required StepsService stepsService,
      required DateTime startTime,
      required DateTime endTime}) async {
    int? steps = await stepsService.getStepsByInterval(
        startTime: startTime, endTime: endTime);

    if (steps != null) {
      debugPrint(steps.toString());
    }
  }

  Future<DateTime?> getLastSyncDate({required StepsClient stepsClient}) async {
    int? id = await getUserId();
    StepLastSyncDate? stepLastSyncDate =
        await stepsClient.getLastSyncDate(id: id!);
    return stepLastSyncDate?.lastSyncDate!;
  }

  bool checkIfTimeDifferenceIsGreaterThan12Hours(
      DateTime startDateTime, DateTime endDateTime) {
    Duration timeDifference = endDateTime.difference(startDateTime);
    return timeDifference.inHours >= 12;
  }
}
