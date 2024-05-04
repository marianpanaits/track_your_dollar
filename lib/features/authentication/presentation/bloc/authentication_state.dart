import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationFailedState extends AuthenticationState {
  final String? message;

  const AuthenticationFailedState(this.message);
}

class AuthenticationSuccessState extends AuthenticationState {}

class LogoutSuccessState extends AuthenticationState {}

class LogoutFailedState extends AuthenticationState {
  final String? message;

  const LogoutFailedState(this.message);
}

class LogoutLoadingState extends AuthenticationState {}
