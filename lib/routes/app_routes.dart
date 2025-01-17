import 'package:auto_route/auto_route.dart';

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
    AutoRoute(page: LoginRoute.page,initial: true),
    AutoRoute(page: VideoCallRoute.page),
    AutoRoute(page: NewRoute.page)
  ];
}