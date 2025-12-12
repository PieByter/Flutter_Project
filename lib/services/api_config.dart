import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String baseUrlWeb = "http://172.30.112.1:8080";
  static const String baseurlDevice = "http://172.30.112.1:8080";

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
