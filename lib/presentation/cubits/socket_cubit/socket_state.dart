import 'package:equatable/equatable.dart';

abstract class SocketState extends Equatable {
  const SocketState();
}

class SocketInitial extends SocketState {
  @override
  List<Object> get props => [];
}

class SocketEmittedState extends SocketState {
  final String event;
  final dynamic data;

  const SocketEmittedState({required this.event, required this.data});

  @override
  List<Object> get props => [event, data];
}

class SocketLoading extends SocketState {
  const SocketLoading();
  @override
  List<Object?> get props => [];
}

class SocketErrorState extends SocketState {
  final String message;

  const SocketErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SocketIncommingCall extends SocketState {
  final String callerId;

  const SocketIncommingCall({required this.callerId});

  @override
  List<Object> get props => [callerId];
}

class SocketTokenState extends SocketState {
  final String token;
  final String otherUserId;

  const SocketTokenState(this.token,this.otherUserId);

  @override
  List<Object?> get props => [token];
}
