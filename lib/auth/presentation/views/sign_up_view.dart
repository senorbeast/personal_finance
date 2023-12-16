import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String username = '';
  String email = '';
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
          _signUpSection(tt, cs),
          TextButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(const ChangeAuthStep(AuthStep.login));
              },
              child: const Text("Already have a account ? Login"))
        ],
      ),
    );
  }

  Column _signUpSection(
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
              "Sign Up",
              style: tt.titleLarge!.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: cs.onTertiaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
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
          style: tt.titleMedium!.copyWith(
            color: cs.onTertiaryContainer,
          ),
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          onChanged: (value) {
            setState(() {
              email = value;
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
        ElevatedButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
                  SignUpUser(email, username, password),
                );
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
