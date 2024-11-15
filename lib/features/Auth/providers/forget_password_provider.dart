import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Method to send OTP request
  Future<void> sendOTP(String mobile) async {
    _isLoading = true;
    _errorMessage = ''; // Clear any previous errors
    notifyListeners();

    try {
      // Assuming your API URL is something like this
      final response = await Dio().post(
        'https://your-api.com/send-otp', // Replace with actual API endpoint
        data: {'mobile': mobile},
      );

      if (response.statusCode == 200) {
        // Handle successful OTP request
        print('OTP sent successfully');
      } else {
        // Handle failure (example)
        _errorMessage = 'Failed to send OTP. Please try again.';
      }
    } catch (e) {
      // Handle any errors
      _errorMessage = 'An error occurred. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
