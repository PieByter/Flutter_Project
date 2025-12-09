import 'package:http/http.dart' as http;
import 'api_config.dart';

class ApiService {
  static Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('${ApiConfig.baseUrl}/login'),
      headers: ApiConfig.defaultHeaders,
      body: {'email': email, 'password': password},
    );
  }

  static Future<http.Response> getFoods() {
    return http.get(
      Uri.parse('${ApiConfig.baseUrl}/foods'),
      headers: ApiConfig.defaultHeaders,
    );
  }
}
