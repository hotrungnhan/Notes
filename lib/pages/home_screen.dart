import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Hello from template',
          ),
          Text(
            'google',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () => {context.go("/item/1")},
            child: const Text("google.com"),
          )
        ],
      ),
    );
  }
}
