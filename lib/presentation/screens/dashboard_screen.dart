import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app_frontend/presentation/cubits/dashboard_cubit/dashbard_state.dart';
import 'package:video_call_app_frontend/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:video_call_app_frontend/presentation/cubits/videocall_signaling_cubit/videocall_signaling_cubit.dart';
import 'package:video_call_app_frontend/presentation/cubits/videocall_signaling_cubit/videocall_signaling_state.dart';
import 'package:video_call_app_frontend/routes/app_routes.dart';

import '../../di/get_it.dart';
import '../utils/app_colors.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget implements AutoRouteWrapper {
  const DashboardScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardCubit>()..getUsers(),
      child: this,
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    context.read<VideoCallSignalingCubit>().join();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: BlocConsumer<VideoCallSignalingCubit, VideoCallSignalingState>(
        listener: (context, state) {
          if (state is VideoCallSignalingIncommingCall) {
            context.pushRoute(IncomingCallRoute(callerId: state.callerId));
          }
          if (state is VideoCallSignalingTokenState) {
            print("${state.token} ${state.otherUserId}");
            context.pushRoute(VideoCallRoute());
          }
          if (state is VideoCallSignalingErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.errorRed,
                content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is VideoCallSignalingLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocConsumer<DashboardCubit, DashbardState>(
              listener: (context, state) {
            if (state is DashboardError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColors.errorRed,
                  content: Text(state.message)));
            }
          }, builder: (context, state) {
            if (state is DashboardLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DashboardSuccess) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].phoneNumber.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<VideoCallSignalingCubit>().callUser(
                              userId: state.users[index].id.toString());
                        },
                        icon: Icon(Icons.call)),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Some error accured"),
              );
            }
          });
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      context.read<VideoCallSignalingCubit>().leave();
      context.read<VideoCallSignalingCubit>().disconnect();
    }
    if (state == AppLifecycleState.paused) {
      context.read<VideoCallSignalingCubit>().leave();
    }
    if (state == AppLifecycleState.resumed) {
      context.read<VideoCallSignalingCubit>().join();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
