import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {

  const SignupInitial();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {

  const SignupLoading();
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {

  const SignupSuccess();
  @override
  List<Object?> get props => [];
}

class SignupError extends SignupState {
  final String message;

  const SignupError(this.message);

  @override
  List<Object?> get props => [message];
}
