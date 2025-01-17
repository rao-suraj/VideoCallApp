import 'package:injectable/injectable.dart';
import 'package:video_call_app_frontend/domain/repository/test_repository.dart';

@LazySingleton(as: TestRepository)
class TestRepositoryImpl implements TestRepository {

}