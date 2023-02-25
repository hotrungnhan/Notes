import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part "switch_game.service.chopper.dart";

@ChopperApi()
abstract class SwitchGameService extends ChopperService {
  static SwitchGameService create() {
    var client = ChopperClient(
      baseUrl: Uri.parse(
          dotenv.get("SWITCH_GAME_API_URL", fallback: "https://fallback.com")),
    );
    return _$SwitchGameService(client);
  }

  @Get(path: "/switch/games")
  Future<Response> getGames();
}
