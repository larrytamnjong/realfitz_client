import 'package:health/health.dart';
import 'package:realfitzclient/constants/strings.dart';

class StepsService {
  final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: false);

  Future<int?> getStepsByInterval(
      {required DateTime startTime, required DateTime endTime}) async {
    bool isAccessStepsDataAuthorized = await stepsDataAccessAuthorization();
    int? steps;
    if (isAccessStepsDataAuthorized) {
      try {
        steps = await _health.getTotalStepsInInterval(startTime, endTime);
        return steps;
      } catch (error) {
        throw Exception(error);
      }
    } else {
      throw Exception(AppStrings.authorizationNotGranted);
    }
  }

  Future<bool> stepsDataAccessAuthorization() async {
    return await _health.requestAuthorization([HealthDataType.STEPS]);
  }
}
