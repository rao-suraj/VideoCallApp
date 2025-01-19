import 'package:equatable/equatable.dart';

abstract class VideoCallSignalingState extends Equatable {
  const VideoCallSignalingState();
}

class VideoCallSignalingInitial extends VideoCallSignalingState {
  @override
  List<Object> get props => [];
}

class VideoCallSignalingEmittedState extends VideoCallSignalingState {
  final String event;
  final dynamic data;

  const VideoCallSignalingEmittedState({required this.event, required this.data});

  @override
  List<Object> get props => [event, data];
}

class VideoCallSignalingLoading extends VideoCallSignalingState {
  const VideoCallSignalingLoading();
  @override
  List<Object?> get props => [];
}

class VideoCallSignalingErrorState extends VideoCallSignalingState {
  final String message;

  const VideoCallSignalingErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class VideoCallSignalingIncommingCall extends VideoCallSignalingState {
  final String callerId;

  const VideoCallSignalingIncommingCall({required this.callerId});

  @override
  List<Object> get props => [callerId];
}

class VideoCallSignalingTokenState extends VideoCallSignalingState {
  final String token;
  final String otherUserId;

  const VideoCallSignalingTokenState(this.token,this.otherUserId);

  @override
  List<Object?> get props => [token];
}
