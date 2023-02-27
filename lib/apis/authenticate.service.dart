import "dart:async";
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:notes/models/credential.dart';

part "authenticate.service.chopper.dart";
part 'authenticate.service.g.dart';

@SerializersFor([Credential])
final Serializers authenticateServiceSerializers =
    _$authenticateServiceSerializers;

@ChopperApi(baseUrl: "/auth")
abstract class AuthenticateService extends ChopperService {
  static AuthenticateService create([ChopperClient? client]) {
    return _$AuthenticateService(client);
  }

  @Post(path: "/login")
  Future<Response<Credential>> login(
      @Field("password") String username, @Field("password") String password);

  @Post(path: "/register")
  Future<Response<Credential>> register(
      @Field("password") String username, @Field("password") String password);

  @Post(path: "/revoke")
  Future<Response<Credential>> revoke(
      @Field("pre_access_token") String preAccessToken,
      @Field("revoke_token") String revokeToken);
}
