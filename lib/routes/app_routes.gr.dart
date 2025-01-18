// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginScreen());
    },
  );
}

/// generated route for
/// [NewScreen]
class NewRoute extends PageRouteInfo<void> {
  const NewRoute({List<PageRouteInfo>? children})
      : super(
          NewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NewScreen());
    },
  );
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignupScreen());
    },
  );
}

/// generated route for
/// [VideoCallScreen]
class VideoCallRoute extends PageRouteInfo<void> {
  const VideoCallRoute({List<PageRouteInfo>? children})
      : super(
          VideoCallRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoCallRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VideoCallScreen();
    },
  );
}
