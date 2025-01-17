import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:either_dart/either.dart';
import 'package:video_call_app_frontend/data/models/app_error.dart';
import 'package:video_call_app_frontend/data/models/request_models/login_request_model.dart';
import 'package:video_call_app_frontend/data/models/user.dart';
import '../../../domain/repository/user_repository.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;

  LoginCubit(this._userRepository) : super(const LoginInitial());

  void login({required String identifier, required String password}) async {
    emit(const LoginLoading());
    late LoginRequestModel loginRequestModel;
    bool isPhone = _isPhoneNumber(identifier);
    if (isPhone) {
      loginRequestModel = LoginRequestModel(phoneNumber: identifier, password: password);
    } else {
      loginRequestModel = LoginRequestModel(userName: identifier, password: password);
    }

    Either<AppError, User> response;
      response = await _userRepository.login(
          loginRequestModel: loginRequestModel);

    response.fold(
      (error) => emit(LoginError(error.message ?? "Login failed")),
      (userInfo) {
        emit(LoginSuccess(userInfo));
      },
    );
  }

  bool _isPhoneNumber(String input) {
    final phoneRegExp =
        RegExp(r'^[0-9]{10}$');
    return phoneRegExp.hasMatch(input);
  }
}
