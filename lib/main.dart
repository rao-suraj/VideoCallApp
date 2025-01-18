import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_call_app_frontend/core/services/local_storage_service.dart';
import 'package:video_call_app_frontend/routes/app_routes.dart';
import 'data/models/user.dart';
import 'di/get_it.dart';
import 'presentation/cubits/socket_cubit/socket_cubit.dart';

var authenticated = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  await Hive.initFlutter();

  final storage = getIt<LocalStorageService>();
  await storage.initializeHive();
  final User? user = storage.getUser();
  if (user != null) {
    authenticated = true;
  }

  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  final _router = AppRouter();
  VideoCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SocketCubit>())
      ],
      child: MaterialApp.router(
        routerConfig: _router.config(),
      ),
    );
  }
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(
        LoginRoute(
          onResult: (success) {
            // if success == true the navigation will be resumed
            // else it will be aborted
            resolver.next(success);
          },
        ),
      );
    }
  }
}
