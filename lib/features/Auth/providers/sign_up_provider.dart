import 'package:flutter/material.dart';
import 'package:kalyan/api/api_service.dart';

class SignUpProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Function to call the sign-up API
  Future<void> signUp({
    required String name,
    required String mobile,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await ApiService().signUpUser(
        name: name,
        mobile: mobile,
        password: password,
      );

      if (response.statusCode == 200) {
        // Account creation successful, can handle success actions here
      } else {
        _errorMessage = 'Failed to create account';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
