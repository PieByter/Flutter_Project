import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String baseUrlWeb = "http://192.168.18.158:8080";
  static const String baseurlDevice = "http://192.168.18.158:8080";

  static String get baseUrl {
    if (kIsWeb) {
      return baseUrlWeb;
    } else {
      return baseurlDevice;
    }
  }

  static const Map<String, String> defaultHeaders = {
    "Content-type": "application/json",
    'Accept': "application/json",
  };
}
