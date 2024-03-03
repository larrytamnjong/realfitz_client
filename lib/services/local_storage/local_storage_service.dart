import 'package:shared_preferences/shared_preferences.dart';

import '../../models/onboarding/user.dart';

class LocalStorageService {
  static Future<bool> saveUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', user.id!);
      await prefs.setString('name', user.name!);
      await prefs.setString('phone', user.phone!);
      await prefs.setString('email', user.email!);
      await prefs.setString('countryCode', user.countryCode!);
      await prefs.setString('country', user.country!);
      await prefs.setString('creationDate', user.creationDate!);
      return true;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      User user = User(
          id: prefs.getString('id'),
          phone: prefs.getString('phone'),
          email: prefs.getString('email'),
          name: prefs.getString('name'),
          creationDate: prefs.getString('creationDate'),
          country: prefs.getString('country'),
          countryCode: prefs.getString('countryCode'));

      return user;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<String?> getUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('id');
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<User> getUserDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      User user = User();
      user.id = prefs.getString('id');
      user.phone = prefs.getString('phone');
      user.email = prefs.getString('email');
      user.name = prefs.getString('name');
      user.creationDate = prefs.getString('creationDate');
      user.country = prefs.getString('country');
      user.countryCode = prefs.getString('countryCode');
      return user;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<String?> getUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('name');
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<bool> isUserStoredInLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('id');
      if (userId == null) {
        return false;
      }
      return true;
    } catch (exception) {
      return false;
    }
  }

  static removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('id');
      await prefs.remove('phone');
      await prefs.remove('email');
      await prefs.remove('name');
      await prefs.remove('creationDate');
      await prefs.remove('countryCode');
      await prefs.remove('country');
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
