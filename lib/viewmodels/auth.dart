import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../models/user.dart';

abstract class AuthEvent {
  const AuthEvent();
}

@immutable
class LoginEvent extends AuthEvent {
  const LoginEvent(this.email, this.password);

  final String email;
  final String password;
}

@immutable
class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

@immutable
class AuthenticatedState extends AuthState {
  const AuthenticatedState({this.user});

  final User? user;
  @override
  List<Object?> get props => [user];
}

@immutable
class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}

@immutable
class AuthPendingState extends AuthState {
  const AuthPendingState();
}

@immutable
class AuthErrorState extends AuthState {
  const AuthErrorState({this.error});
  final Exception? error;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const UnauthenticatedState()) {
    on<LoginEvent>((event, emit) async {
      if (state is AuthPendingState) return;
      if (state is AuthenticatedState) return;
      emit(const AuthPendingState());
      try {
        await Future.delayed(const Duration(milliseconds: 1000)).whenComplete(
            () => emit(
                AuthenticatedState(user: User(event.email, event.password))));
      } on Exception catch (e) {
        emit(AuthErrorState(error: e));
      }
    });
    on<LogoutEvent>((event, emit) {
      emit(const UnauthenticatedState());
    });
  }
  @override
  void onChange(change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
