import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes/viewmodels/game_list.dart';
import 'apis/switch_game.service.dart';
import 'viewmodels/auth.dart';

class GlobalProvider extends StatelessWidget {
  GlobalProvider({super.key, required this.child});
  final Widget child;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final SwitchGameService _switchGameService = SwitchGameService.create();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FlutterSecureStorage>(
            create: (_) => _secureStorage,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => AuthBloc(),
            ),
            BlocProvider<SwitchGameListBloc>(
                create: (_) =>
                    SwitchGameListBloc(switchGameService: _switchGameService)),
          ],
          child: child,
        ));
  }
}
