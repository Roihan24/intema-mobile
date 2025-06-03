import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://192.168.56.1/api"; // Ganti IP jika pakai real device

  // Login method
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login.php");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("Login - STATUS: ${response.statusCode}");
      print("Login - BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to login. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      throw Exception("Login failed: $e");
    }
  }

  // Register method
  static Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse("$baseUrl/register.php");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("Register - STATUS: ${response.statusCode}");
      print("Register - BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to register. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during registration: $e");
      throw Exception("Registration failed: $e");
    }
  }

  // Midtrans Transaction method
  static Future<Map<String, dynamic>> createTransaction(int amount, String orderId) async {
    final url = Uri.parse("$baseUrl/create_transaction.php");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "amount": amount,
          "order_id": orderId,
        }),
      );

      print("Transaction - STATUS: ${response.statusCode}");
      print("Transaction - BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to create transaction. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during transaction: $e");
      throw Exception("Transaction failed: $e");
    }
  }
}
