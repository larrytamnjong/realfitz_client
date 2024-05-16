import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class StepService {
  // StepService() {
  //   Health().configure(useHealthConnectIfAvailable: true);
  // }

  final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: true);

  Future<int?> getStepsByTimeInterval(
      {required DateTime startTime, required DateTime endTime}) async {
    int? steps;
    {
      try {
        //steps = await Health().getTotalStepsInInterval(startTime, endTime);
        steps = await _health.getTotalStepsInInterval(startTime, endTime);
        return steps;
      } catch (exception) {
        throw Exception(exception);
      }
    }
  }

  Future<int?> getTodaySteps() async {
    try {
      DateTime endTime = DateTime.now().subtract(const Duration(days: 0));
      DateTime startTime = DateTime(endTime.year, endTime.month, endTime.day);
      int? todaySteps =
          await getStepsByTimeInterval(startTime: startTime, endTime: endTime);
      return todaySteps;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> requestAuthorization() async {
    try {
      await Permission.activityRecognition.request();
      await Permission.location.request();
      // return await Health().requestAuthorization([HealthDataType.STEPS],
      return await _health.requestAuthorization([HealthDataType.STEPS],
          permissions: [HealthDataAccess.READ_WRITE]);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool?> hasPermissions() async {
    try {
      // bool? hasPermissions = await Health().hasPermissions(
      bool? hasPermissions = await _health.hasPermissions(
          [HealthDataType.STEPS],
          permissions: [HealthDataAccess.READ_WRITE]);
      if (hasPermissions == null) {
        return false;
      }
      return hasPermissions;
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
