import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/models/step/last_sync_date.dart';

import '../../constants/api_urls.dart';
import '../../models/step/StepTarget.dart';
import '../../models/step/step.dart';

class StepClient {
  Future<StepLastSyncDate?> getLastSyncDate({required String id}) async {
    try {
      final response = await http.get(Uri.parse('$getLastSyncTimeUrl$id'));
      if (response.statusCode == 200) {
        return StepLastSyncDate.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> syncSteps({required Step steps}) async {
    try {
      final response = await http.post((Uri.parse(syncStepsUrl)),
          body: jsonEncode(steps.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<StepTarget?> getUserStepTarget({required String id}) async {
    try {
      final response = await http.get(Uri.parse('$getUserStepTargetUrl$id'));
      if (response.statusCode == 200) {
        return StepTarget.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> updateUserStepTarget({required StepTarget stepTarget}) async {
    try {
      final response = await http.put(Uri.parse(updateUserStepTargetUrl),
          body: jsonEncode(stepTarget.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
