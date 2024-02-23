import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/models/step/last_sync_date.dart';

import '../../constants/api_urls.dart';

class StepsClient {
  Future<StepLastSyncDate?> getLastSyncDate({required int id}) async {
    try {
      final response = await http.get(Uri.parse('$lastSyncTimeUrl$id'));
      if (response.statusCode == 200) {
        return StepLastSyncDate.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
