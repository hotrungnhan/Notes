import "dart:async";
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import '../models/switch_game.dart';

part "switch_game.service.chopper.dart";
part 'switch_game.service.g.dart';

@SerializersFor([SwitchGame])
final Serializers switchServiceSerializers = _$switchServiceSerializers;

@ChopperApi()
abstract class SwitchGameService extends ChopperService {
  static SwitchGameService create([ChopperClient? client]) {
    return _$SwitchGameService(client);
  }

  @Get(path: "/switch/games")
  Future<Response<Iterable<SwitchGame>>> getGames();

  @Get(path: "/error")
  Future<Response<Iterable<SwitchGame>>> getErrors();
}
