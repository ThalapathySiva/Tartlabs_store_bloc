import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tartlabs_store_bloc/models/token.dart';

class PreferenceHelper {
  static Future<Token> getToken() async {
    String value;
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.get("token");
    if (value?.isEmpty ?? true) {
      return null;
    } else {
      Map<String, dynamic> map = await _parseJson(value);
      return Token.fromJson(map);
    }
  }

  static saveToken(Token token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (token == null) return;
    String tokenString = jsonEncode(token.toJson());
    pref.setString("token", tokenString);
  }

  static clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static Future<Map<String, dynamic>> _parseJson(String text) {
    return compute(_parseAndDecode, text);
  }
}
