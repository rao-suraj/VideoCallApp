import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  dynamic post({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.post(
      path,
      data: params,
    );
    return response.data;
  }

  dynamic get({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(
      path,
      queryParameters: params,
    );
    return response.data;
  }
}
