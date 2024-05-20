import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

class StepService {
  StepService() {
    Health().configure(useHealthConnectIfAvailable: true);
  }

  Future<bool> getHealthConnectSdkStatus() async {
    try {
      final status = await Health().getHealthConnectSdkStatus();
      debugPrint(status.toString());
      if (status == HealthConnectSdkStatus.sdkAvailable) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<int?> getStepsByTimeInterval(
      {required DateTime startTime, required DateTime endTime}) async {
    int? steps;
    {
      try {
        steps = await Health().getTotalStepsInInterval(startTime, endTime);
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
      if (Platform.isAndroid) {
        await Permission.activityRecognition.request();
        await Permission.location.request();
      }
      return await Health().requestAuthorization([HealthDataType.STEPS],
          permissions: Platform.isIOS
              ? [HealthDataAccess.READ]
              : [HealthDataAccess.READ_WRITE]);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> hasPermissions() async {
    try {
      // bool? hasPermissions = await Health().hasPermissions(
      //   [HealthDataType.STEPS],
      //   permissions: [HealthDataAccess.READ],
      // );
      await requestAuthorization();
      // if (hasPermissions == null) {
      //   showInfoSnackBar(message: AppStrings.undefinedPermissionStatus);
      // } else if (hasPermissions == false) {
      //   showInfoSnackBar(message: AppStrings.permissionActionNeeded);
      // }
      return true;
    } catch (exception) {
      showInfoSnackBar(message: exception.toString());
      throw Exception(exception);
    }
  }
}
