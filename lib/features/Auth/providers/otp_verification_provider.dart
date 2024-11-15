import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OtpVerificationProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isOtpVerified = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  bool get isOtpVerified => _isOtpVerified;
  String get errorMessage => _errorMessage;

  // API call to verify OTP
  Future<void> verifyOtp(String otp) async {
    _isLoading = true;
    notifyListeners();

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://your-api-url.com/verify-otp',
        data: {'otp': otp}, // Pass OTP to the API
      );

      if (response.statusCode == 200) {
        // Handle success, for example, verify the OTP and proceed
        _isOtpVerified = true;
        _errorMessage = '';
      } else {
        // Handle failure response
        _isOtpVerified = false;
        _errorMessage = 'Invalid OTP. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
