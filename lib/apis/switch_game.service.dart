import "dart:async";
import 'package:chopper/chopper.dart';

part "switch_game.service.chopper.dart";

@ChopperApi()
abstract class SwitchGameService extends ChopperService {
  static SwitchGameService create([ChopperClient? client]) =>
      _$SwitchGameService(client);
  @Get(path: "/switch/games")
  Future<Response> getGames();
}
