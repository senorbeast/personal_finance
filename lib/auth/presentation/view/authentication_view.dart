// authentication_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';
import 'package:personal_finance/auth/presentation/view/login_view.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: const AuthenticationForm(),
    );
  }
}

// authentication_form.dart

class AuthenticationForm extends StatelessWidget {
  const AuthenticationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return const LoginView();
      },
    );
  }
}
