import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/utils/app_constants.dart';

import '../../data/models/user.dart';

abstract class LocalStorageService {
  Future<void> initializeHive();
  void storeUser({required User user});
  User? getUser();
}

@LazySingleton(as: LocalStorageService)
class HiveService implements LocalStorageService {
  
  HiveService();

  @override
  Future<void> initializeHive() async {
    Hive.registerAdapter(UserAdapter());
    await Hive.openBox<User>(HiveConstants.userHiveBox);
  }

  @override
  void storeUser({required User user}) {
    final userBox = Hive.box<User>(HiveConstants.userHiveBox);
    userBox.put(HiveConstants.userKey, user);
  }

  @override
  User? getUser() {
    final userBox = Hive.box<User>(HiveConstants.userHiveBox);
    return userBox.get(HiveConstants.userKey);
  }
}
