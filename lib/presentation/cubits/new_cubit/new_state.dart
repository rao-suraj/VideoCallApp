import 'package:equatable/equatable.dart';

abstract class NewState extends Equatable {
  const NewState();
}

class NewInitial extends NewState {
  const NewInitial();

  @override
  List<Object?> get props => [];
}

class NewSuccess extends NewState {
  const NewSuccess();

  @override
  List<Object?> get props => [];
}

class NewLoading extends NewState {
  const NewLoading();
  @override
  List<Object?> get props => [];
}
