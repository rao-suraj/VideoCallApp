import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/core/api/api_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketService {
  void emit(String event, dynamic data);
  void listen(String event, Function(dynamic) callback);
  void removeListener(String event, Function(dynamic) callback);
  void disconnect();
  void join({required String userId});
  void leave({required String userId});
}

@LazySingleton(as: SocketService)
class IOSocket implements SocketService {
  late IO.Socket socket;

  IOSocket() {
    socket = IO.io(
      ApiConstants.baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.onConnect((_) => print('Connected to socket'));
    socket.onDisconnect((_) => print('Disconnected from socket'));
    socket.connect();
  }

  @override
  void emit(String event, dynamic data) => socket.emit(event, data);

  @override
  void listen(String event, Function(dynamic) callback) =>
      socket.on(event, callback);

  @override
  void removeListener(String event, Function(dynamic) callback) =>
      socket.off(event, callback);

  @override
  void disconnect() => socket.disconnect();

  @override
  void join({required String userId}) {
    socket.emit('join', userId);
  }

  @override
  void leave({required String userId}) {
    print("LEAVE CALLED");
    socket.emit('leave', userId);
  }
}
