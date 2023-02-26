import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'error.g.dart';

abstract class DefaultError
    implements Built<DefaultError, DefaultErrorBuilder> {
  String get status;

  DefaultError._();
  factory DefaultError([void Function(DefaultErrorBuilder) updates]) =
      _$DefaultError;
  static Serializer<DefaultError> get serializer => _$defaultErrorSerializer;
}

abstract class SwitchGameError
    implements Built<SwitchGameError, SwitchGameErrorBuilder> {
  String get status;

  SwitchGameError._();
  factory SwitchGameError([void Function(SwitchGameErrorBuilder) updates]) =
      _$SwitchGameError;
  static Serializer<SwitchGameError> get serializer =>
      _$switchGameErrorSerializer;
}
