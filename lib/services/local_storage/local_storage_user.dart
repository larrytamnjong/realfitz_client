import 'package:shared_preferences/shared_preferences.dart';

import '../../models/authentication/user.dart';

class UserLocalStorageManager {
  static Future<bool> saveUserToLocalStorage(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('id', user.id!);
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

  static Future<User?> getUserFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      User user = User(
          id: prefs.getInt('id'),
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

  static Future<int?> getUserIdFromLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt('id');
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static Future<bool> isUserStoredInLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('id');
      if (userId == null) {
        return false;
      }
      return true;
    } catch (exception) {
      return false;
    }
  }

  static removeUserFromLocalStorage() async {
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
