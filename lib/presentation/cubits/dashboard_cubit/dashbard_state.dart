import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';

abstract class DashbardState extends Equatable {
  const DashbardState();
}

class DashboardInitial extends DashbardState {
  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashbardState {
  @override
  List<Object> get props => [];
}

class DashboardSuccess extends DashbardState {
  final List<User> users;

  const DashboardSuccess({required this.users});

  @override
  List<Object> get props => [users];
}

class DashboardError extends DashbardState {
  final String message;

  const DashboardError({required this.message});

  @override
  List<Object> get props => [message];
}