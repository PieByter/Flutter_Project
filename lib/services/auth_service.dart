import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<Map<String, dynamic>> login(
    String nikOrEmail,
    String password,
  ) async {
    final response = await http.post(
      (Uri.parse('${ApiConfig.baseUrl}/login')),
      headers: ApiConfig.defaultHeaders,
      body: jsonEncode({'nik_or_email': nikOrEmail, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login gagal: ${response.statusCode}');
    }
  }

  // static Future<Map<String, dynamic>> login(
  //   String nikOrEmail,
  //   String password,
  // ) async {
  //   try {
  //     print('🔵 [DEBUG] Login dimulai...');
  //     print('🔵 [DEBUG] URL: ${ApiConfig.baseUrl}/login');
  //     print('🔵 [DEBUG] Mengirim: nikOrEmail=$nikOrEmail');

  //     final response = await http
  //         .post(
  //           Uri.parse('${ApiConfig.baseUrl}/login'),
  //           headers: ApiConfig.defaultHeaders,
  //           body: jsonEncode({
  //             'nik_or_email': nikOrEmail,
  //             'password': password,
  //           }),
  //         )
  //         .timeout(
  //           const Duration(seconds: 10),
  //           onTimeout: () {
  //             print('❌ [ERROR] Request timeout!');
  //             throw Exception('Request timeout - Backend tidak merespons');
  //           },
  //         );

  //     print('🔵 [DEBUG] Status Code: ${response.statusCode}');
  //     print('🔵 [DEBUG] Response: ${response.body}');

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw Exception('Login gagal: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('❌ [ERROR] Login Error: $e');
  //     rethrow;
  //   }
  // }

  static Future<Map<String, dynamic>> register({
    required String nama,
    required String email,
    required String password,
    required String nik,
  }) async {
    final body = {
      'nama': nama,
      'email': email,
      'password': password,
      'nik': nik,
    };

    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/register'),
      headers: ApiConfig.defaultHeaders,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Register gagal: ${response.statusCode}');
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
