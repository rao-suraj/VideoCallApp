import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/domain/repository/test_repository.dart';
import 'package:video_call_app_frontend/presentation/cubits/new_cubit/new_state.dart';

@injectable
class NewCubit extends Cubit<NewState> {
  final TestRepository _repository;
  NewCubit(this._repository) : super(const NewInitial());

  getSuccess() async {
    emit(const NewLoading());

    await Future.delayed(Duration(seconds: 5));

    emit(const NewSuccess());
  }
}
