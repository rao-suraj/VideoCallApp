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

class SocketErrorState extends SocketState {
  final String message;

  const SocketErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SocketReceivedCallState extends SocketState {
  final String callerId;

  const SocketReceivedCallState({required this.callerId});

  @override
  List<Object> get props => [callerId];
}