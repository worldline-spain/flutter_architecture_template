// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:worldline_flutter/data/datasources/local/default_local_datasource.dart'
    as _i6;
import 'package:worldline_flutter/data/datasources/local/local_data_source.dart'
    as _i5;
import 'package:worldline_flutter/data/datasources/remote/default_remote_datasource.dart'
    as _i9;
import 'package:worldline_flutter/data/datasources/remote/remote_datasource.dart'
    as _i8;
import 'package:worldline_flutter/data/repositories/example/example_repository.dart'
    as _i13;
import 'package:worldline_flutter/data/repositories/system/system_repository.dart'
    as _i11;
import 'package:worldline_flutter/data/services/api_service.dart' as _i3;
import 'package:worldline_flutter/di/di.dart' as _i16;
import 'package:worldline_flutter/domain/repositories/example/example_repository.dart'
    as _i12;
import 'package:worldline_flutter/domain/repositories/system/system_respository.dart'
    as _i10;
import 'package:worldline_flutter/env/env.dart' as _i4;
import 'package:worldline_flutter/ui/navigation/main_navigator.dart' as _i7;
import 'package:worldline_flutter/ui/viewmodels/home/home_viewmodel.dart'
    as _i14;
import 'package:worldline_flutter/ui/viewmodels/splash/splash_viewmodel.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiServiceModule = _$ApiServiceModule();
    final diModule = _$DiModule();
    gh.lazySingleton<_i3.ApiService>(() => apiServiceModule.httpClient);
    gh.singleton<_i4.Env>(diModule.env);
    gh.factory<_i5.LocalDataSource>(() => _i6.DefaultLocalDataSource());
    gh.singleton<_i7.MainNavigator>(diModule.navigator);
    gh.factory<_i8.RemoteDatasource>(
        () => _i9.DefaultRemoteDatasource(gh<_i3.ApiService>()));
    gh.factory<_i10.SystemRepository>(
        () => _i11.SystemRepositoryImpl(gh<_i5.LocalDataSource>()));
    gh.factory<_i12.ExampleRepository>(
        () => _i13.ExampleRepositoryImpl(gh<_i8.RemoteDatasource>()));
    gh.factory<_i14.HomeViewModel>(() => _i14.HomeViewModel(
          gh<_i7.MainNavigator>(),
          gh<_i12.ExampleRepository>(),
        ));
    gh.factory<_i15.SplashViewModel>(() => _i15.SplashViewModel(
          gh<_i7.MainNavigator>(),
          gh<_i10.SystemRepository>(),
        ));
    return this;
  }
}

class _$ApiServiceModule extends _i3.ApiServiceModule {}

class _$DiModule extends _i16.DiModule {}
