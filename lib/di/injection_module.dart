import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/core/api/api_constants.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          contentType: Headers.jsonContentType,
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: Duration(seconds: 5 * 1000),
          receiveTimeout: Duration(seconds: 5 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000)
        ),
      );
}
