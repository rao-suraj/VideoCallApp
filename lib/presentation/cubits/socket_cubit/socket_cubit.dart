import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/domain/repository/user_repository.dart';
import 'package:video_call_app_frontend/presentation/cubits/socket_cubit/socket_state.dart';
import 'package:video_call_app_frontend/presentation/utils/constants.dart';

import '../../../core/services/socket_service.dart';

@injectable
class SocketCubit extends Cubit<SocketState> {
  final SocketService _socketService;
  final UserRepository _userRepository;
  late int? userId;
  SocketCubit(this._socketService, this._userRepository)
      : super(SocketInitial()) {
    final response = _userRepository.getUserId();

    response.fold((l) {
      emit(SocketErrorState(message: l.message ?? "Something went wrong"));
      userId = null;
    }, (r) => userId = r);
  }

  void join() {
    if (userId != null) {
      _socketService.join(userId: userId.toString());
    } else {
      print("USER ID NULL FOR SOCKET JOIN");
    }
  }

  void leave() {
    if (userId != null) {
      _socketService.leave(userId: userId.toString());
    } else {
      print("USER ID NULL FOR SOCKET LEAVE");
    }
  }

  void listen() {
    _socketService.listen(SocketConstants.receiveEvent, (data) {
      emit(SocketReceivedCallState(callerId: data.callerId));
    });
  }

  void removeListener(String event, Function(dynamic) callback) {
    _socketService.removeListener(event, callback);
  }

  void disconnect() {
    _socketService.disconnect();
  }
}
