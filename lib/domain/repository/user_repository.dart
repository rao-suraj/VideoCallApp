import 'package:either_dart/either.dart';
import 'package:video_call_app_frontend/data/models/response_models/get_all_user_response_model.dart';

import '../../data/models/app_error.dart';
import '../../data/models/request_models/login_request_model.dart';
import '../../data/models/user.dart';

abstract class UserRepository {
  Future<Either<AppError, User>> login(
      {required LoginRequestModel loginRequestModel});
  Future<Either<AppError, User>> signup(
      String userName, String phoneNumber, String password);
  Future<void> logout();
  Future<Either<AppError, GetAllUserResponseModel>> getUsers();
  Either<AppError, int> getUserId();
}
