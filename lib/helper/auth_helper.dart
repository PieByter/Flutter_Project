import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../screens/authentication/login_page.dart';

class AuthHelper {
  static Future<void> logout(BuildContext context) async {
    await AuthService.logout();
    if (!context.mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Berhasil Logout")));
  }

  static Future<bool> requireAuth(BuildContext context) async {
    final isLoggedIn = await AuthService.isLoggedIn();
    if (!isLoggedIn && context.mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    }
    return isLoggedIn;
  }
}
