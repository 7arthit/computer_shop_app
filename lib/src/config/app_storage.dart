import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppStorageKeys {
  static String token = "TOKEN_KEY";
  static String user = "USER_KEY";
  static String pincode = "PINCODE_KEY";
  static String pincodeDate = "PINCODE_DATE_KEY";
}

class AppStorage {
  final Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  static AppStorage get shared {
    return AppStorage();
  }

  // Future<void> setUser(User? user) async {
  //   final shared = await _shared;
  //   if (user != null) {
  //     final json = jsonEncode(user);
  //     shared.setString(AppStorageKeys.user, json);
  //   } else {
  //     shared.remove(AppStorageKeys.user);
  //   }
  // }
  //
  // Future<User?> getUser() async {
  //   final shared = await _shared;
  //   final source = shared.getString(AppStorageKeys.user);
  //   if (source != null) {
  //     final json = jsonDecode(source);
  //     final user = User.fromJson(json);
  //     return user;
  //   }
  //   return null;
  // }

  Future<void> setToken(String? token) async {
    final shared = await _shared;
    if (token != null) {
      shared.setString(AppStorageKeys.token, token);
    } else {
      shared.remove(AppStorageKeys.token);
    }
  }

  Future<String?> getToken() async {
    final shared = await _shared;
    final token = shared.getString(AppStorageKeys.token);
    return token;
  }

  Future<void> setPincode(String? pincode) async {
    final shared = await _shared;
    if (pincode != null) {
      shared.setString(AppStorageKeys.pincode, pincode);
    } else {
      shared.remove(AppStorageKeys.pincode);
    }
  }

  Future<String?> getPincode() async {
    final shared = await _shared;
    final pincode = shared.getString(AppStorageKeys.pincode);
    return pincode;
  }

  Future<void> setPincodeDate(DateTime date) async {
    final shared = await _shared;
    String value = dateFormat.format(date);
    shared.setString(AppStorageKeys.pincodeDate, value);
  }

  Future<DateTime> getPincodeDate() async {
    final shared = await _shared;
    final value = shared.getString(AppStorageKeys.pincodeDate);
    if (value != null) {
      return dateFormat.parse(value);
    }
    return DateTime.now();
  }
}
