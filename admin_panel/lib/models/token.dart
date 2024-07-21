// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  final String accessToken;
  static const accessTokenString = 'access_token';
  Token({
    required this.accessToken,
  });

  Future<void> persistTokens() async {
    final prefs = await SharedPreferences.getInstance();
    print(accessToken);
    await Future.wait([
      prefs.setString(accessTokenString, accessToken),
    ]);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(accessTokenString),
    ]);
  }

  static Future<Token?> fetchTokens() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(accessTokenString);
      if (accessToken != null) {
        return Token(accessToken: accessToken);
      }
    } catch (_) {}
    return null;
  }

  @override
  String toString() => accessToken;
}
