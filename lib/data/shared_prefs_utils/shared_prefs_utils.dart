import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPrefsUtils {
  static Future<void> saveApiToken(String apiToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", apiToken);
    print(apiToken);
  }

  static Future<void> saveFirebaseToken(String firebaseToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("firebasetoken", firebaseToken);
    print(firebaseToken);
  }

  static Future<String?> getApiToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<void> deleteApiToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    String? token = prefs.getString("token");
    if (token == null) {
      print("Token successfully deleted.");
    } else {
      print("Failed to delete the token.");
    }
  }

  static Future<String?> getFirebaseToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firebasetoken");
  }

  static Future<void> saveUserData(
      {String? email,
      String? number,
      String? fullName,
      String? address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (email != null) {
      await prefs.setString("email", email);
    }
    if (number != null) {
      await prefs.setString("number", number);
    }
    if (fullName != null) {
      await prefs.setString("fullName", fullName);
    }
    if (address != null) {
      await prefs.setString("address", address);
    }
  }

  static Future<Map<String, String?>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString("email");
    final String? number = prefs.getString("number");
    final String? fullName = prefs.getString("fullName");
    final String? address = prefs.getString("address");
    return {
      "email": email,
      "number": number,
      "fullName": fullName,
      "address": address,
    };
  }
}
