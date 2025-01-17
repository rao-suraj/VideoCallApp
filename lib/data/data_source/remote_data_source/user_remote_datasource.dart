import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/core/api/api_client.dart';
import 'package:video_call_app_frontend/core/api/api_constants.dart';
import 'package:video_call_app_frontend/data/models/request_models/login_request_model.dart';
import 'package:video_call_app_frontend/data/models/user.dart';

import '../../models/request_models/signup_request_model.dart';

abstract class UserRemoteDatasource {
  Future<User> login({required LoginRequestModel loginRequestModel});
  Future<User> signup({required SignupRequestModel signupRequestModel});
  Future<void> logout();
}

@LazySingleton(as: UserRemoteDatasource)
class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final ApiClient _apiClient;

  UserRemoteDatasourceImpl(this._apiClient);

  @override
  Future<User> login({required LoginRequestModel loginRequestModel}) async {
    final response =await _apiClient.get(path: ApiConstants.login ,params: loginRequestModel.toJson());
    return User.fromJson(response);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signup({required SignupRequestModel signupRequestModel}) async {
    final response = await _apiClient.post(path: ApiConstants.signup, params: signupRequestModel.toJson());
    return User.fromJson(response);
  }

}