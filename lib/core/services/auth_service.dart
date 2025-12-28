import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _tokenKey = 'auth_token';
  static const _roleKey = 'auth_role';

  static Future<void> saveLogin(String token, String role) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_tokenKey, token);
    await p.setString(_roleKey, role);
  }

  static Future<bool> isLoggedIn() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_tokenKey) != null;
  }

  static Future<String?> getRole() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_roleKey);
  }

  static Future<void> logout() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(_tokenKey);
    await p.remove(_roleKey);
  }
}
