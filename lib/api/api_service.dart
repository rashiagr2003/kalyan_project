import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_constants.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.productionBaseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  /// Fetch app details from the API.
  Future<Map<String, dynamic>?> fetchAppDetails() async {
    try {
      final response = await _dio.post(
        'https://your-api-url.com/app_details', // Replace with actual URL
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load app details: ${response.statusCode}');
      }
    } on DioError catch (e) {
      debugPrint('DioError: ${e.message}');
      if (e.response != null) {
        debugPrint('Response error: ${e.response?.data}');
      } else {
        debugPrint('Request failed: ${e.message}');
      }
      return null;
    } catch (e) {
      debugPrint('General error: $e');
      return null;
    }
  }

  /// Fetch and post game list data.
  Future<Map<String, dynamic>?> fetchGameList(String token) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.productionBaseUrl}${ApiConstants.gameList}',
        data: {"token": token}, // Sending token as part of the request
      );

      if (response.statusCode == 200) {
        return response.data; // Return the data for the game list
      } else {
        throw Exception('Failed to load game list: ${response.statusCode}');
      }
    } on DioError catch (e) {
      debugPrint('DioError: ${e.message}');
      if (e.response != null) {
        debugPrint('Response error: ${e.response?.data}');
      } else {
        debugPrint('Request failed: ${e.message}');
      }
      return null;
    } catch (e) {
      debugPrint('General error: $e');
      return null;
    }
  }

  /// Example: Posting user sign-up data
  Future<Response> signUpUser({
    required String name,
    required String mobile,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.signUp,
        data: {"name": name, "mobile": mobile, "password": password},
      );
      return response;
    } on DioError catch (e) {
      debugPrint('DioError during sign-up: ${e.message}');
      if (e.response != null) {
        debugPrint('Response error: ${e.response?.data}');
        throw Exception(e.response?.data['message'] ?? 'Something went wrong');
      } else {
        debugPrint('Request failed: ${e.message}');
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      debugPrint('General error during sign-up: $e');
      throw Exception('Something went wrong during sign-up');
    }
  }
}
