import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:video_call_app_frontend/main.dart';

import '../presentation/screens/login_screen.dart';
import '../presentation/screens/new_screen.dart';
import '../presentation/screens/signup_screen.dart';
import '../presentation/screens/videocall_screen.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: VideoCallRoute.page,initial: true,guards: [AuthGuard()]),
    AutoRoute(page: NewRoute.page)
  ];
}