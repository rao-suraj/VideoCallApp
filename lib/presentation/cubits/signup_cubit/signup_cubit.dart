import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/domain/repository/user_repository.dart';
import 'package:video_call_app_frontend/presentation/cubits/signup_cubit/signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final UserRepository _userRepository;
  SignupCubit(this._userRepository) : super(SignupInitial());

  void signup({
    required String username,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    print("SignupCubit: signup");
    emit(SignupLoading());

    // final response = await _userRepository.signup(username, phoneNumber, password);

    // response.fold(
    //   (error) => emit(SignupError(error.message?? "something went wrong")),
    //   (user) => emit(SignupSuccess()),
    // );
    await Future.delayed(Duration(seconds: 4));

    emit(SignupSuccess());
  }
}
