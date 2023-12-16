import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _loginSection(tt, cs),
          TextButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(const ChangeAuthStep(AuthStep.signup));
              },
              child: const Text("Don't have a account ? Sign Up"))
        ],
      ),
    );
  }

  Column _loginSection(
    TextTheme tt,
    ColorScheme cs,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Log In",
              style: tt.titleLarge!.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: cs.onTertiaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Column(
          children: [
            TextField(
              style: tt.titleMedium!.copyWith(
                color: cs.onTertiaryContainer,
              ),
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              style: tt.titleMedium!.copyWith(
                color: cs.onTertiaryContainer,
              ),
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 24.0),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(LogInUser(username, password));
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
