import 'package:dio/dio.dart';
import 'package:unblockmycar/core/interceptor/custom_interceptor.dart';
import 'package:unblockmycar/core/utils/urls/base_urls.dart';

class ApiServices {
  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: BaseUrls.api,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            followRedirects: true,
            validateStatus: (_) => true,
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..interceptors.addAll([
          CustomInterceptor(),
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
          ),
        ]);

  /// Generic GET request
  static Future<Response> get(String endpoint, {dynamic data}) async {
    try {
      return await _dio.get(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  /// Generic POST request
  static Future<Response> post(
    String endpoint,
    Map<String, dynamic> data, {
    ProgressCallback? onSendProgress,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw Exception('POST request failed: ${e.message}');
    }
  }
}
