import 'package:hive/hive.dart';

class DBHelper {
  static Box getBox() => Hive.box('userBox');

  static Future<void> register(
    String username,
    String email,
    String password,
  ) async {
    final box = getBox();
    await box.put(email, {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  static Future<Map<String, dynamic>?> login(
    String email,
    String password,
  ) async {
    final box = getBox();
    final user = box.get(email);
    if (user != null && user['password'] == password) {
      return Map<String, dynamic>.from(user);
    }
    return null;
  }
}
