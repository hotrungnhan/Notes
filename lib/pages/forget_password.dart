import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'forget password',
          ),
          TextButton(
            onPressed: () => {context.go("/login")},
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
