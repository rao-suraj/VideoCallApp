import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:video_call_app_frontend/data/data_source/remote_data_source/user_remote_datasource.dart';
import 'package:video_call_app_frontend/data/models/app_error.dart';
import 'package:video_call_app_frontend/data/models/request_models/signup_request_model.dart';
import 'package:video_call_app_frontend/data/models/response_models/get_all_user_response_model.dart';
import 'package:video_call_app_frontend/data/models/user.dart';
import 'package:video_call_app_frontend/domain/repository/user_repository.dart';
import 'package:video_call_app_frontend/utils/api_call_with_error.dart';
import 'package:video_call_app_frontend/utils/app_enums.dart';

import '../models/request_models/login_request_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _userRemoteDatasource;
  final UserLocalDataSource _localStorageService;

  const UserRepositoryImpl(
      this._userRemoteDatasource, this._localStorageService);

  @override
  Future<Either<AppError, User>> login(
      {required LoginRequestModel loginRequestModel}) {
    return ApiCallWithError.call(() async {
      final userData = await _userRemoteDatasource.login(
          loginRequestModel: loginRequestModel);

      _localStorageService.storeUser(user: userData);
      return userData;
    });
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, User>> signup(
      String userName, String phoneNumber, String password) {
    final signupRequestModel = SignupRequestModel(
      userName: userName,
      phoneNumber: phoneNumber,
      password: password,
    );
    return ApiCallWithError.call(() async {
      final userData = await _userRemoteDatasource.signup(
          signupRequestModel: signupRequestModel);
      _localStorageService.storeUser(user: userData);
      return userData;
    });
  }

  @override
  Future<Either<AppError, GetAllUserResponseModel>> getUsers() {
    return ApiCallWithError.call(() => _userRemoteDatasource.getUser());
  }

  @override
  Either<AppError, int> getUserId() {
    int? userId = _localStorageService.getUserId();
    if (userId != null) {
      return Right(userId);
    } else {
      return Left(AppError(
          errorType: ErrorType.cache, message: "User not authenticated"));
    }
  }
}
