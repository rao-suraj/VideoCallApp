// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DashboardScreen());
    },
  );
}

/// generated route for
/// [IncomingCallScreen]
class IncomingCallRoute extends PageRouteInfo<IncomingCallRouteArgs> {
  IncomingCallRoute({
    Key? key,
    required String callerId,
    List<PageRouteInfo>? children,
  }) : super(
          IncomingCallRoute.name,
          args: IncomingCallRouteArgs(
            key: key,
            callerId: callerId,
          ),
          initialChildren: children,
        );

  static const String name = 'IncomingCallRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IncomingCallRouteArgs>();
      return IncomingCallScreen(
        key: args.key,
        callerId: args.callerId,
      );
    },
  );
}

class IncomingCallRouteArgs {
  const IncomingCallRouteArgs({
    this.key,
    required this.callerId,
  });

  final Key? key;

  final String callerId;

  @override
  String toString() {
    return 'IncomingCallRouteArgs{key: $key, callerId: $callerId}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required dynamic Function(bool) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return WrappedRoute(
          child: LoginScreen(
        key: args.key,
        onResult: args.onResult,
      ));
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final dynamic Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
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
