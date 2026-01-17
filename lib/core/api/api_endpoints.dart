// lib/core/constants/api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'http://10.0.2.2:5000'; // Android emulator
  // static const String baseUrl = 'http://192.168.1.xxx:5000'; // Real device
  // static const String baseUrl = 'https://api.mypetjoyy.com'; // Production later

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // ── Your actual auth endpoints ───────────────────────────────
  static const String register = '/api/auth/register';
  static const String login = '/api/auth/login';

  // Optional future ones
  // static const String me       = '/api/auth/me';
  // static String userById(String id) => '/api/users/$id';
}
