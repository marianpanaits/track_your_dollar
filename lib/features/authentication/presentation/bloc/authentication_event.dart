import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticateUserEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticateUserEvent({required this.email, required this.password});
}

class SignUpUserEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignUpUserEvent({required this.email, required this.password});
}

class CheckUserAuthenticatedEvent extends AuthenticationEvent {}

class LogoutUserEvent extends AuthenticationEvent {}
