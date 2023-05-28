import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceUtils {
  SharedPrefrenceUtils._internal();
  static SharedPrefrenceUtils instance = SharedPrefrenceUtils._internal();
  factory SharedPrefrenceUtils() => instance;
  late SharedPreferences preferences;

  Future<void> initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> getSignedInStatus(String key) async {
    return preferences.getBool(key) ?? false;
  }

  Future<void> setSignedInStatus() async {
    try {
      preferences.setBool("isSignedIN", true);
    } catch (e) {
      debugPrint("Error while Saving Data => $e");
    }
  }

  Future<void> setUserData(List<String> userData) async {
    try {
      preferences.setStringList("userData", userData);
    } catch (e) {
      debugPrint("Error while setUserData => $e");
    }
  }

  Future<List<String>> getUserData() async {
    List<String> userData = [];
    try {
      userData = preferences.getStringList("userData") ?? [];
      return userData;
    } catch (e) {
      debugPrint("Error while getUserData => $e");
      return userData;
    }
  }
}
