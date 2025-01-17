import 'package:equatable/equatable.dart';
import 'package:video_call_app_frontend/data/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final User userInfo;
  const LoginSuccess(this.userInfo);

  @override
  List<Object?> get props => [userInfo];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}
