import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService._internal(this._dio);

  static final ApiService _instance = ApiService._internal(
    Dio(
      BaseOptions(
        // baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 50),
        headers: {"Content-Type": "application/json"},
      ),
    ),
  );

  factory ApiService() => _instance;

  // // Automatically load token from shared preferences
  // Future<void> initialize() async {
  //   // String? token = await PreferencesHelper.instance.getString('accessToken');
  //   if (token != null && token.isNotEmpty) {
  //     // print('token set: ${token}');
  //     setAuthToken(token);
  //   }
  // }

  // Set token manually
  void setAuthToken(String token) {
    _dio.options.headers["Authorization"] = "Bearer $token";
    // print("➡️ Token Sent: ${_dio.options.headers['Authorization']}");
  }

  // Clear token (for logout etc.)
  void clearAuthToken() {
    _dio.options.headers.remove("Authorization");
    // PreferencesHelper.instance.remove('accessToken');
  }

  // GET request (optional token)
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      // await ApiService().initialize();
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      // Handle Dio-related errors
      if (e.response != null) {
        // You can inspect the status code and return a structured error
        final statusCode = e.response?.statusCode ?? 0;
        final errorData = e.response?.data;

        // Optionally log or handle specific codes

        throw {'status': statusCode, 'error': errorData['message']};
      } else {
        // DioException but no response (e.g., timeout)
        throw {'status': 0, 'error': e.message};
      }
    } catch (e) {
      // Handle any non-Dio exceptions
      throw {'status': -1, 'error': e.toString()};
    }
  }

  // POST request
  Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    try {
      // await ApiService().initialize();
      Response response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      // Handle Dio-related errors
      if (e.response != null) {
        // You can inspect the status code and return a structured error
        final statusCode = e.response?.statusCode ?? 0;
        final errorData = e.response?.data;

        // Optionally log or handle specific codes

        throw {'status': statusCode, 'error': errorData['message']};
      } else {
        // DioException but no response (e.g., timeout)
        throw {'status': 0, 'error': e.message};
      }
    } catch (e) {
      // Handle any non-Dio exceptions
      throw {'status': -1, 'error': e.toString()};
    }
  }

  // PUT request
  Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);

      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Upload a file with other form fields via multipart/form-data
  Future<Map<String, dynamic>> uploadFile({
    required String endpoint,
    required File file,
    Map<String, dynamic>? fields, // additional form fields
  }) async {
    try {
      // await initialize(); // ensure token is loaded

      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        ...?fields, // spread additional fields if not null
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      Response response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode ?? 0;
        final errorData = e.response?.data;

        throw {
          'status': statusCode,
          'error': errorData['message'] ?? 'Unknown error',
        };
      } else {
        throw {'status': 0, 'error': e.message};
      }
    } catch (e) {
      throw {'status': -1, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> uploadMultipartFormData(
    String endpoint,
    FormData formData,
  ) async {
    try {
      print("-------------------");
      // await ApiService().initialize(); // Ensure token is set
      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode ?? 0;
        final errorData = e.response?.data;

        throw {
          'status': statusCode,
          'error': errorData['message'] ?? 'Upload failed',
        };
      } else {
        throw {'status': 0, 'error': e.message ?? 'Unknown error'};
      }
    } catch (e) {
      throw {'status': -1, 'error': e.toString()};
    }
  }

  // ... existing code ...

  dynamic _handleError(dynamic error) {
    print("❌ API Error: $error");

    if (error is DioException) {
      final response = error.response;
      final statusCode = response?.statusCode;
      final data = response?.data;

      // Try to extract a user-friendly message from API
      String message = "Something went wrong.";
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        message = data['message'];
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception("Connection timeout. Please try again.");
        case DioExceptionType.receiveTimeout:
          throw Exception("Receive timeout. Check your internet connection.");
        case DioExceptionType.sendTimeout:
          throw Exception("Send timeout. Please try again.");
        case DioExceptionType.cancel:
          throw Exception("Request was cancelled.");
        case DioExceptionType.badResponse:
          // This is where your 401 falls in
          throw Exception("Error $statusCode: $message");
        default:
          throw Exception("Unexpected error: ${error.message}");
      }
    } else {
      throw Exception("Something went wrong.");
    }
  }
}
