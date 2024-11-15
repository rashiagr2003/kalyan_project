import 'package:flutter/material.dart';
import '../../../api/api_service.dart';


class GameListProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<dynamic>? _gameList;
  bool _isLoading = false;
  String? _errorMessage;

  List<dynamic>? get gameList => _gameList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGameList(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchGameList(token);
      if (data != null) {
        _gameList = data[
            "gameList"]; // Adjust the key according to the actual response structure
      } else {
        _gameList = [];
      }
    } catch (e) {
      _errorMessage = 'Error fetching game list: $e';
      _gameList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
