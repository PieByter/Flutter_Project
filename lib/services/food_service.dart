import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/food.dart';
import 'api_config.dart';
import 'auth_service.dart';

Future<List<Food>> fetchFoods() async {
  final token = await AuthService.getToken(); // Perbaiki: pakai await
  if (token == null) {
    throw Exception("Token tidak ditemukan, silakan login ulang.");
  }
  final response = await http.get(
    Uri.parse('${ApiConfig.baseUrl}/makanans'),
    headers: {...ApiConfig.defaultHeaders, 'Authorization': 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((json) => Food.fromJson(json)).toList();
  } else {
    throw Exception(
      'Gagal load makanan: ${response.statusCode} - ${response.body}',
    );
  }
}
