import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/auth/presentation/bloc/authentication_bloc.dart';
import 'package:personal_finance/core/presentation/app_root.dart';

class AppRootWithProviders extends StatelessWidget {
  const AppRootWithProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppRoot();
  }
}
