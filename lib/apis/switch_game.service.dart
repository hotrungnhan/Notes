import "dart:async";
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chopper_built_value/chopper_built_value.dart';
import '../models/switch_game.dart';
import '../utils/http/interceptor.dart';

part "switch_game.service.chopper.dart";
part 'switch_game.service.g.dart';

@SerializersFor([SwitchGame])
final Serializers serializers = _$serializers;

@ChopperApi()
abstract class SwitchGameService extends ChopperService {
  static SwitchGameService create() {
    final builder = serializers.toBuilder();
    builder.addPlugin(StandardJsonPlugin());
    final serializer = builder.build();
    var client = ChopperClient(
      converter: BuiltValueConverter(serializer),
      errorConverter: BuiltValueConverter(serializer),
      interceptors: [ThrowErrorResponseInterceptor()],
      baseUrl: Uri.parse(
          dotenv.get("SWITCH_GAME_API_URL", fallback: "https://fallback.com")),
    );
    return _$SwitchGameService(client);
  }

  @Get(path: "/error")
  Future<Response<Iterable<SwitchGame>>> getGames();
}
