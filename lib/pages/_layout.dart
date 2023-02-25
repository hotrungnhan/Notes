import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/viewmodels/auth.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child});
  final Widget child;
  void logout(BuildContext context) {
    context.read<AuthBloc>().add(const LogoutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("Applications"),
        leading: PlatformIconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => logout(context),
        ),
      ),
      body: child,
    );
  }
}

class LayoutWithoutAppBar extends StatelessWidget {
  const LayoutWithoutAppBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: child,
    );
  }
}
