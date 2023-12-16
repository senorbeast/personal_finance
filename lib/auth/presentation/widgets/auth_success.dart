import 'package:flutter/material.dart';
import 'package:personal_finance/core/presentation/widgets/p_animated_icon.dart';

class AuthSuccess extends StatelessWidget {
  const AuthSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        PAnimatedIcon(
          icon: Icons.check,
        ),
        SizedBox(height: 30),
        Text(
          "Auth Success",
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
