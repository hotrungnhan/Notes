import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/switch_game.dart';
import '../apis/switch_game.service.dart';

typedef SwitchGameListStateType = Future<Iterable<SwitchGame>>?;

class SwitchGameListBloc extends Cubit<SwitchGameListStateType> {
  SwitchGameService switchGameService;

  SwitchGameListBloc({required this.switchGameService}) : super(null);
  void fetch() async {
    var res = switchGameService.getGames().then((value) => value.body!);
    emit(res);
  }

  @override
  void onChange(change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
