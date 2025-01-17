import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'app_enums.dart';
import '../data/models/app_error.dart';

class ApiCallWithError {
  const ApiCallWithError._();

  static Future<Either<AppError, T>> call<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } on SocketException {
      // print("No network error");
      return Left(
        AppError(
          errorType: ErrorType.network,
          message: 'No network connection',
        ),
      );
    } on TimeoutException {
      // print("request timeout");
      return Left(
        AppError(
          errorType: ErrorType.timeout,
          message: 'Request timeout',
        ),
      );
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          // print("R ime Out $e .message");
          return Left(
            AppError(
              errorType: ErrorType.timeout,
              message: 'Request timeout',
            ),
          );
        case DioExceptionType.badResponse:
          // print("something bad");
          {
            if (e.response?.statusCode == 440) {
              return Left(
                AppError(
                  errorType: ErrorType.tokenExpired,
                  message: 'OTP timeout',
                ),
              );
            } else if (e.response?.statusMessage == 'Unauthorized') {
              return Left(
                AppError(
                  errorType: ErrorType.incorrectOtp,
                  message: 'Incorrect OTP',
                ),
              );
            } else {
              return Left(
                AppError(
                  errorType: ErrorType.api,
                  code: e.response?.statusCode,
                  message: e.response?.statusMessage ?? 'Something went wrong!',
                ),
              );
            }
          }
        case DioExceptionType.unknown:
          {
            if (e.error is SocketException) {
              return Left(
                AppError(
                  errorType: ErrorType.network,
                  message: 'No network connection',
                ),
              );
            }
            // print("unknown error");
            return Left(
              AppError(
                errorType: ErrorType.unknown,
                message: e.error.toString(),
              ),
            );
          }
        default:
          // print("Default error");
          return Left(
            AppError(
              errorType: ErrorType.api,
              message: e.response?.data['message'],
            ),
          );
      }
    } on Exception {
      // print("exception");
      return Left(
        AppError(
          errorType: ErrorType.api,
        ),
      );
    }
  }
}
