import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_config.dart';
import 'package:flutter/foundation.dart';

class UserService {
  static String baseUrl = ApiConfig.baseUrl;

  static Future<Map<String, dynamic>> getUserById(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      // Jangan return null; lempar exception atau kembalikan dummy
      throw Exception('Token tidak ditemukan. Silakan login ulang.');
    }

    final uri = Uri.parse('$baseUrl/users/$userId');
    final res = await http.get(
      uri,
      headers: {...ApiConfig.defaultHeaders, 'Authorization': 'Bearer $token'},
    );

    // debugPrint('GET $uri => ${res.statusCode}');
    if (res.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(res.body);
      final payload = data['user'] ?? data['data'] ?? data;
      if (payload is Map<String, dynamic>) return payload;
      throw Exception('Payload user tidak valid.');
    }
    throw Exception('HTTP ${res.statusCode}: ${res.body}');
  }
}
