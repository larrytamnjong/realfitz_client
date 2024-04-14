import 'package:http/http.dart' as http;

import '../../constants/api_urls.dart';

class SettingsClient {
  Future<String?> getWhatsAppSupportNumber() async {
    try {
      final response = await http.get(Uri.parse(getWhatsAppSupportNumberUrl));
      if (response.statusCode == 200) {
        return response.body.toString();
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
