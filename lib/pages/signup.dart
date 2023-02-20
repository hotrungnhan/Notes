import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Signup',
          ),
          TextButton(
            onPressed: () => {context.go("/login")},
            child: const Text("login"),
          )
        ],
      ),
    );
  }
}
