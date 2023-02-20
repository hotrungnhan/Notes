import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/pages/_layout.dart';
import 'package:notes/pages/forget_password.dart';
import 'package:notes/pages/login.dart';
import 'package:notes/pages/signup.dart';

import 'pages/home_screen.dart';
import 'pages/item/[id].dart';

// TODO: move to context ?? soon
// Use to store credential permanently
const storage = FlutterSecureStorage();

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const noAuthPage = ["/login", "/signup", "/forgot-password"];
final _router = GoRouter(
    initialLocation: "/login",
    // errorBuilder: (context, state) => ErrorPage(exception: state.error),
    redirect: (context, state) => storage.read(key: "token").then((tok) {
          var isAuth = tok != null;
          var isContainNoAuthPage = noAuthPage.contains(state.location);
          if (isAuth) {
            return isContainNoAuthPage ? "/" : null;
          } else {
            return isContainNoAuthPage ? null : "/login";
          }
        }),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          if (noAuthPage.contains(state.location)) {
            return child;
          }
          return Layout(child: child);
        },
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/item/:id',
            builder: (context, state) => const ItemScreen(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/signup',
            builder: (context, state) => const SignupScreen(),
          ),
          GoRoute(
            path: '/forgot-password',
            builder: (context, state) => const ForgotPassword(),
          ),
        ],
      )
    ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

void main() {
  runApp(const MyApp());
}
