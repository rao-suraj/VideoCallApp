import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/data/models/request_models/accept_call_request_model.dart';
import 'package:video_call_app_frontend/data/models/request_models/reject_call_request_model.dart';
import 'package:video_call_app_frontend/data/models/response_models/token_response_model.dart';
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
    print("JOIN CALLED");
    if (userId != null) {
      _socketService.join(userId: userId.toString());
      listen();
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
    _socketService.listen(SocketConstants.incomingnCallEvent, (callerId) {
      print("CALL INCOMING");
      emit(SocketIncommingCall(callerId: callerId));
    });

    _socketService.listen(SocketConstants.tokenEvent, (data) {
      // try {
      final response = TokenResponseModel.fromJson(data);
      emit(SocketTokenState(response.token, response.otherUserId));
      // } catch (e) {
      //   emit(SocketErrorState(message: "Could not get call data"));
      //   print(e);
      // }
    });
  }

  void removeListener(String event, Function(dynamic) callback) {
    _socketService.removeListener(event, callback);
  }

  void disconnect() {
    _socketService.disconnect();
  }

  void acceptCall({required String callerId}) {
    emit(SocketLoading());
    _socketService.emit(
        SocketConstants.acceptCallEvent,
        AcceptCallRequestModel(
            callerId: callerId, receiverId: userId!.toString()));
  }

  void endCall({required String id}) {
    _socketService.emit(SocketConstants.endCallEvent,
        RejectCallRequestModel(userId: userId!.toString(), id: id).toJson());
  }

  void callUser({required String userId}) {
    _socketService.emit(
        SocketConstants.callUserEvent,
        AcceptCallRequestModel(
            callerId: this.userId!.toString(), receiverId: userId));
  }
}
