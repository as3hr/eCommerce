import 'package:shared_preferences/shared_preferences.dart';

class Token {
  final String bearerToken;
  static const bearerTokenString = 'bearer_token';

  Token({required this.bearerToken});

  @override
  String toString() => bearerToken;

  Future<void> persistToken() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setString(bearerTokenString, bearerToken),
    ]);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(bearerTokenString),
    ]);
  }

  static Future<Token?> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    final bearerToken = prefs.getString(bearerTokenString);
    if (bearerToken != null) {
      return Token(bearerToken: bearerToken);
    }
    return null;
  }
}
