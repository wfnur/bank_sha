import 'dart:convert';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;


class AuthService {
  // This class will handle authentication-related tasks
  // such as login, logout, and user session management.

  Future<bool> checkEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // Email is available
        return jsonDecode(response.body)['is_email_exist'];
      } else {
        // Email is already taken
        return jsonDecode(response.body)['errors'];
      }
    } catch (e) {
      // Handle error
      rethrow;
    }
  }

  // Example method for user login
  Future<bool> login(String username, String password) async {
    // Implement your login logic here
    return true; // Return true if login is successful
  }

  // Example method for user logout
  Future<void> logout() async {
    // Implement your logout logic here
  }
}