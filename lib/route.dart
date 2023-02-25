import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/_layout.dart';
import 'pages/forget_password.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'viewmodels/auth.dart';
import 'pages/home_screen.dart';
import 'pages/item/[id].dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const _noAuthUri = ["/login", "/signup", "/forgot-password"];
final router = GoRouter(
    initialLocation: "/login",
    // errorBuilder: (context, state) => kDebugMode? null: ErrorPage(exception: state.error),
    routes: [
      ShellRoute(
        builder: (context, state, child) => BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) {
            return previous != current &&
                (current is UnauthenticatedState ||
                    current is AuthenticatedState);
          },
          listener: (context, state) {
            state is AuthenticatedState
                ? context.go("/")
                : context.go("/login");
          },
          child: _noAuthUri.contains(state.location)
              ? LayoutWithoutAppBar(child: child)
              : Layout(child: child),
        ),
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
