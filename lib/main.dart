import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_call_app_frontend/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:video_call_app_frontend/routes/app_routes.dart';
import 'di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  await Hive.initFlutter();

  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  final _router = AppRouter();
  VideoCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: _router.config(),
      ),
    );
  }
}
