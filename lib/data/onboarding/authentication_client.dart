import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realfitzclient/constants/api_urls.dart';
import 'package:realfitzclient/models/onboarding/advert_images.dart';

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

  Future<bool> deleteAccount() async {
    try {
      final response = await http.put(Uri.parse(deleteUserUrl),
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

  Future<User?> whatsAppLogin({required String phone}) async {
    try {
      final response = await http.get(Uri.parse('$whatsAppLoginUrl$phone'));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> updateUserDetail() async {
    try {
      final response = await http.put(Uri.parse(updateUserUrl),
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

  Future<List<AdImage>?> getAdImages() async {
    try {
      final response = await http.get(Uri.parse(getAdImageUrls));
      if (response.statusCode == 200) {
        final List<dynamic> jsonImages = jsonDecode(response.body);
        final List<AdImage> adImages =
            jsonImages.map((image) => AdImage.fromJson(image)).toList();
        return adImages;
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
