import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  String confirmationCode = '';
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Enter Code",
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
                    confirmationCode = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(EnterConfirmationCode(confirmationCode));
            },
            child: const Text('Submit Code'),
          ),
        ],
      ),
    );
  }
}
