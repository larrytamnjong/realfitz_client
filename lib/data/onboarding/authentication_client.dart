import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';

import '../../models/onboarding/user.dart';

class AuthenticationClient {
  User? user;

  Future<bool> createAccount() async {
    try {
      final response = await http.post(Uri.parse(createAccountUrl),
          body: jsonEncode(user?.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<User?> login() async {
    try {
      final response = await http.post(Uri.parse(loginUrl),
          body: jsonEncode(user!.toJson()));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
