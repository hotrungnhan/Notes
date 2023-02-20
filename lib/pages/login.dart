import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Login',
          ),
          TextButton(
            onPressed: () => {context.go("/")},
            child: const Text("Home"),
          ),
          TextButton(
            onPressed: () => {context.go("/forgot-password")},
            child: const Text("Forget Password !"),
          ),
          TextButton(
            onPressed: () => {context.go("/signup")},
            child: const Text("Sign Up"),
          )
        ],
      ),
    );
  }
}
