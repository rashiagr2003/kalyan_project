import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../api/api_constants.dart';
// Replace with your actual constants file

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loginUser(String mobile, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Create Dio instance
      Dio dio = Dio(BaseOptions(
        baseUrl: ApiConstants.productionBaseUrl,
        connectTimeout: Duration(milliseconds: 200),
        receiveTimeout: Duration(milliseconds: 200),
      ));

      // Perform the API call
      final response = await dio.post(
        ApiConstants.loginUser, // Replace with actual login API endpoint
        data: {
          "mobile": mobile,
          "password": password,
        },
      );

      // Check for success
      if (response.statusCode == 200) {
        // Handle successful login (store token, navigate, etc.)
        _errorMessage = '';
        // You can store the token or user data in SharedPreferences or another storage
      }
    } catch (e) {
      // Handle error
      _errorMessage = 'Login failed. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
