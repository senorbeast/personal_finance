import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/domain/usecases/auth_use_case.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';
import 'package:personal_finance/core/presentation/app_root.dart';
import 'package:personal_finance/core/setup/injectable_setup.dart';
import 'package:personal_finance/home/domain/repository/dashboard_repository.dart';
import 'package:personal_finance/home/domain/usecases/dashboard_use_cases.dart';
import 'package:personal_finance/home/presentation/bloc/home_bloc.dart';

class AppRootWithProviders extends StatelessWidget {
  const AppRootWithProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(getIt<AuthenticationUseCase>()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            getIt<DashboardUseCase>(),
          ),
        ),
      ],
      child: const AppRoot(),
    );
  }
}
