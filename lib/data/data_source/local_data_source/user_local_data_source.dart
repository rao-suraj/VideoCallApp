import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/core/services/local_storage_service.dart';

import '../../models/user.dart';

abstract class UserLocalDataSource {
  void storeUser({required User user});
  User? getUser();
  int? getUserId();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final LocalStorageService _localStorageService;

  const UserLocalDataSourceImpl(this._localStorageService);
  @override
  User? getUser() {
    return _localStorageService.getUser();
  }

  @override
  void storeUser({required User user}) {
    _localStorageService.storeUser(user: user);
  }

  @override
  int? getUserId() {
    final user = _localStorageService.getUser();
    return user?.id;
  }
}
