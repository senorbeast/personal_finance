import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';
import 'package:personal_finance/core/setup/injectable_setup.dart';
import 'package:personal_finance/home/domain/usecases/dashboard_use_cases.dart';
import 'package:personal_finance/home/presentation/bloc/home_bloc.dart';
import 'package:personal_finance/home/presentation/widgets/transaction_table.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String userId = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: tt.titleLarge!.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: cs.onTertiaryContainer,
                ),
              ),
            ],
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              final AuthUser authUser = state.authUser!;

              return Column(
                children: [
                  Text('UserId ${authUser.userId}'),
                  Text('User name ${authUser.username}'),
                  // Text('Sign In details ${authUser.signInDetails.toString()}'),
                ],
              );
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(GetUserData(userId, email));
                      context.read<HomeBloc>().add(GetAllTransactions(userId));
                    },
                    child: const Text("Fetch Details"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "User Data: ${state.user?.toJson().toString()}",
                    style: tt.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "All Transactions",
                    style: tt.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TransactionTable(transactions: state.transactions),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
