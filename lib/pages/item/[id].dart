import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

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
            onPressed: () => {context.go("/")},
            child: const Text("go back home"),
          )
        ],
      ),
    );
  }
}
