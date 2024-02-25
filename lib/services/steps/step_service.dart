import 'package:health/health.dart';

class StepService {
  final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: false);

  Future<int?> getStepsByInterval(
      {required DateTime startTime, required DateTime endTime}) async {
    int? steps;
    {
      try {
        steps = await _health.getTotalStepsInInterval(startTime, endTime);
        return steps;
      } catch (error) {
        throw Exception(error);
      }
    }
  }

  Future<bool> requestAuthorization() async {
    return await _health.requestAuthorization([HealthDataType.STEPS]);
  }
}
