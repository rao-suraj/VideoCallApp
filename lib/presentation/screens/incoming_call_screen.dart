import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app_frontend/presentation/cubits/videocall_signaling_cubit/videocall_signaling_cubit.dart';

@RoutePage()
class IncomingCallScreen extends StatelessWidget {
  final String callerId;
  const IncomingCallScreen({super.key, required this.callerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                context.read<VideoCallSignalingCubit>().endCall(id: callerId);
                context.maybePop();
              },
              child: Text("Decline")),
          TextButton(
              onPressed: () {
                context.read<VideoCallSignalingCubit>().acceptCall(callerId: callerId);
                context.maybePop();
              },
              child: Text("Accept")),
        ],
      ),
    ));
  }
}
