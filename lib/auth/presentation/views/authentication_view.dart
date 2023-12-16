// authentication_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/domain/usecases/auth_use_case.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';
import 'package:personal_finance/auth/presentation/views/confirmation_view.dart';
import 'package:personal_finance/auth/presentation/views/login_view.dart';
import 'package:personal_finance/auth/presentation/views/sign_up_view.dart';
import 'package:personal_finance/core/presentation/widgets/toastify.dart';
import 'package:personal_finance/core/setup/injectable_setup.dart';
import 'package:personal_finance/home/presentation/views/homepage.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        getIt<AuthenticationUseCase>(),
      ),
      child: const AuthenticationForm(),
    );
  }
}

// authentication_form.dart

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        final ToastifyModel toastifyValue = state.toastifyModel;
        if (toastifyValue.title != "") {
          toastify(
            context: context,
            title: toastifyValue.title,
            description: toastifyValue.description,
          );
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            if (state.authStep == AuthStep.login) {
              return const LoginView();
            } else if (state.authStep == AuthStep.signup ||
                state.authStep == AuthStep.confirmationCode) {
              if (state.authStep == AuthStep.signup) {
                return const SignUpView();
              } else if (state.authStep == AuthStep.confirmationCode) {
                return const ConfirmationView();
              }
            }
          } else if (state.status == AuthenticationStatus.authenticated) {
            return const Homepage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
