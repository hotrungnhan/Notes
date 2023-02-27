import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'credential.g.dart';

@HiveType(typeId: 0)
abstract class Credential
    with EquatableMixin, HiveObjectMixin
    implements Built<Credential, CredentialBuilder> {
  @HiveField(0)
  @BuiltValueField(wireName: 'access_token')
  String get accessToken;
  @HiveField(1)
  @BuiltValueField(wireName: 'revoke_token')
  String get revokeToken;
  @HiveField(2)
  @BuiltValueField(wireName: 'access_token_expired_at')
  DateTime get accessTokenExpiredAt;
  @HiveField(3)
  @BuiltValueField(wireName: 'revoke_token_expired_at')
  DateTime get revokeTokenExpiredAt;

  Credential._();
  factory Credential([void Function(CredentialBuilder) updates]) = _$Credential;
  static Serializer<Credential> get serializer => _$credentialSerializer;

  @override
  List<Object?> get props =>
      [accessToken, revokeToken, accessTokenExpiredAt, revokeTokenExpiredAt];
}
