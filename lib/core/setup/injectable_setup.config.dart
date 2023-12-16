// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../auth/data/datasources/remote.dart' as _i3;
import '../../auth/data/repository/auth_repository_impl.dart' as _i5;
import '../../auth/domain/repository/auth_repository.dart' as _i4;
import '../../auth/domain/usecases/auth_use_case.dart' as _i6;
import '../../auth/presentation/bloc/authentication_bloc.dart' as _i7;

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
    gh.lazySingleton<_i3.RemoteDataSource>(() => _i3.RemoteDataSource());
    gh.factory<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(gh<_i3.RemoteDataSource>()));
    gh.factory<_i6.AuthenticationUseCase>(
        () => _i6.AuthenticationUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i7.AuthenticationBloc>(
        () => _i7.AuthenticationBloc(gh<_i6.AuthenticationUseCase>()));
    return this;
  }
}
