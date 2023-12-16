// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../auth/data/datasources/amplify_auth.dart' as _i4;
import '../../auth/data/repository/auth_repository_impl.dart' as _i6;
import '../../auth/domain/repository/auth_repository.dart' as _i5;
import '../../auth/domain/usecases/auth_use_case.dart' as _i7;
import '../../auth/presentation/bloc/authentication_bloc.dart' as _i12;
import '../../home/data/datasources/amplify_api.dart' as _i3;
import '../../home/data/repository/dashboard_repository_impl.dart' as _i9;
import '../../home/domain/repository/dashboard_repository.dart' as _i8;
import '../../home/domain/usecases/dashboard_use_cases.dart' as _i10;
import '../../home/presentation/bloc/home_bloc.dart' as _i11;

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
    gh.lazySingleton<_i3.AmplifyApi>(() => _i3.AmplifyApi());
    gh.lazySingleton<_i4.AmplifyAuth>(() => _i4.AmplifyAuth());
    gh.factory<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(gh<_i4.AmplifyAuth>()));
    gh.factory<_i7.AuthenticationUseCase>(
        () => _i7.AuthenticationUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i8.DashboardRepository>(
        () => _i9.DashboardRepositoryImpl(gh<_i3.AmplifyApi>()));
    gh.factory<_i10.DashboardUseCase>(
        () => _i10.DashboardUseCase(gh<_i8.DashboardRepository>()));
    gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(gh<_i10.DashboardUseCase>()));
    gh.factory<_i12.AuthenticationBloc>(
        () => _i12.AuthenticationBloc(gh<_i7.AuthenticationUseCase>()));
    return this;
  }
}
