import 'package:shared_preferences/shared_preferences.dart';

class AppStorageKeys {
  static String token = "TOKEN_KEY";
}

class AppStorage {
  final Future<SharedPreferences> _shared = SharedPreferences.getInstance();

  static AppStorage get shared {
    return AppStorage();
  }

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
}
