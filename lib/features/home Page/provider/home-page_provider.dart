import 'package:flutter/material.dart';

import '../../../api/api_service.dart';
import '../models/app_detail_model.dart';

import 'package:flutter/foundation.dart';

class AppDetailsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService(); // Assuming ApiService is correctly implemented
  AppDetailsModel? _appDetails;
  bool _isLoading = false;

  AppDetailsModel? get appDetails => _appDetails;
  bool get isLoading => _isLoading;

  Future<void> fetchAppDetails() async {
    _isLoading = true;
    notifyListeners();
    try {
      // Send a POST request to fetch app details
      final response = await _apiService.fetchAppDetails();
      
      // Check if the response is not null and parse it
      if (response != null) {
        _appDetails = AppDetailsModel.fromJson(response); // Assuming response is a Map
      } else {
        _appDetails = null;
      }
    } catch (e) {
      _appDetails = null;
      debugPrint('Error fetching app details: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
