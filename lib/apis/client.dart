import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chopper_built_value/chopper_built_value.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes/apis/switch_game.service.dart';
import 'package:notes/utils/http/bearer_authenticator.dart';
import '../models/error.dart';
import '../utils/http/interceptor.dart';
import 'authenticate.service.dart';

final _mainClientSerializers = (Serializers().toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..merge(switchServiceSerializers)
      ..add(SwitchGameError.serializer)
      ..add(DefaultError.serializer))
    .build();

class MainClientJwtTokenProvider implements TokenGetter {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  @override
  FutureOr<String?> getToken() {
    return _secureStorage.read(key: "AccessToken");
  }
}

final mainClient = ChopperClient(
    converter: BuiltValueConverter(_mainClientSerializers),
    errorConverter:
        BuiltValueConverter(_mainClientSerializers, errorType: DefaultError),
    interceptors: [ThrowErrorInterceptor()],
    authenticator: BearerAuthenticator.from(MainClientJwtTokenProvider()),
    baseUrl: Uri.parse(
        dotenv.get("SWITCH_GAME_API_URL", fallback: "https://fallback.com")),
    services: [SwitchGameService.create(), AuthenticateService.create()]);
