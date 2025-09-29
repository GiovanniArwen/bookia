import 'dart:convert';

import 'package:bookia/features/auth/data/models/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences pref;
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static setData(String key, dynamic value) {
    if (value is String) {
      pref.setString(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is int) {
      pref.setInt(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static String kUserData = 'user_data';
  static setUserData(UserData ?userData) async {
    if (userData == null) return;
    //parse object to json
    var objectJson = userData.toJson();
    //encode json to string using (jsonEncoder)
    var userDataString = json.encode(objectJson);
    // save to shared prefreences
    await pref.setString(kUserData, userDataString);
  }

  static Future<UserData?> getUserData() async {
    //1) get string from shared preferences
    var source = pref.getString(kUserData);
    if (source == null) return null;

    //2) decode string to json
    var jsonData = json.decode(source);

    //3) parse json to object
    return UserData.fromJson(jsonData);
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static String? getString(String key) {
    return pref.getString(key);
  }

  static Future<bool> setString(String key, String value) {
    return pref.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) {
    return pref.setBool(key, value);
  }

  static bool? getBool(String key) {
    return pref.getBool(key);
  }

  static int? getInt(String key) {
    return pref.getInt(key);
  }

  static Future<bool> setInt(String key, int value) {
    return pref.setInt(key, value);
  }

  static double? getDouble(String key) {
    return pref.getDouble(key);
  }

  static Future<bool> setDouble(String key, int value) {
    return pref.setInt(key, value);
  }

  static Future<bool> clear() {
    return pref.clear();
  }
}
