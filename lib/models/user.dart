import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class User extends Equatable {
  const User(this.email, this.password);
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];
}
