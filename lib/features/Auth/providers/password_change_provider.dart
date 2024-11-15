import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PasswordChangeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Method to change password
  Future<void> changePassword(String newPassword) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Create Dio instance for the API request
      Dio dio = Dio();
      var response = await dio.post(
        'https://your-api-url.com/change-password', // Replace with your API URL
        data: {
          'password': newPassword,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful password change
        // You can navigate or show success message
      } else {
        // Handle error response from the API
        _errorMessage = 'Failed to change password. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
