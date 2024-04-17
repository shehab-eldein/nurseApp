import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model/user.dart';

class SFManager {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userJson = json.encode(user.toJson());
    await prefs.setString('user', userJson);
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString('user');
    if (userJson != null) {
      final Map<String, dynamic> userMap = json.decode(userJson);
      return User.fromJson(userMap);
    } else {
      return null;
    }
  }
}
