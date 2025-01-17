// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_client.dart' as _i424;
import '../core/services/local_storage_service.dart' as _i1003;
import '../data/data_source/local_data_source/user_local_data_source.dart'
    as _i56;
import '../data/data_source/remote_data_source/user_remote_datasource.dart'
    as _i658;
import '../data/repository/test_repository_impl.dart' as _i786;
import '../data/repository/user_repository_impl.dart' as _i890;
import '../domain/repository/test_repository.dart' as _i1073;
import '../domain/repository/user_repository.dart' as _i541;
import '../presentation/cubits/login_cubit/login_cubit.dart' as _i402;
import '../presentation/cubits/new_cubit/new_cubit.dart' as _i476;
import '../presentation/cubits/signup_cubit/signup_cubit.dart' as _i53;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio());
    gh.lazySingleton<_i1073.TestRepository>(() => _i786.TestRepositoryImpl());
    gh.lazySingleton<_i1003.LocalStorageService>(() => _i1003.HiveService());
    gh.lazySingleton<_i424.ApiClient>(() => _i424.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i476.NewCubit>(
        () => _i476.NewCubit(gh<_i1073.TestRepository>()));
    gh.lazySingleton<_i658.UserRemoteDatasource>(
        () => _i658.UserRemoteDatasourceImpl(gh<_i424.ApiClient>()));
    gh.lazySingleton<_i56.UserLocalDataSource>(
        () => _i56.UserLocalDataSourceImpl(gh<_i1003.LocalStorageService>()));
    gh.lazySingleton<_i541.UserRepository>(() => _i890.UserRepositoryImpl(
          gh<_i658.UserRemoteDatasource>(),
          gh<_i1003.LocalStorageService>(),
        ));
    gh.factory<_i402.LoginCubit>(
        () => _i402.LoginCubit(gh<_i541.UserRepository>()));
    gh.factory<_i53.SignupCubit>(
        () => _i53.SignupCubit(gh<_i541.UserRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}
