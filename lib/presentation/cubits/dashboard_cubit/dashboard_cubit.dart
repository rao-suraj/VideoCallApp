import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/domain/repository/user_repository.dart';
import 'package:video_call_app_frontend/presentation/cubits/dashboard_cubit/dashbard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashbardState> {
  final UserRepository _userRepository;
  DashboardCubit(this._userRepository) : super(DashboardInitial());

  void getUsers() async {
    emit(DashboardLoading());

    final response = await _userRepository.getUsers();
    response.fold((l) => DashboardError(message: l.message?? "Some unknown error accured"), (r) => emit(DashboardSuccess(users: r.users)));

    // emit(DashboardSuccess(users: List.empty()));
  }
}
