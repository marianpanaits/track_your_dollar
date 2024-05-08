import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/authentication_params.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/check_user_authenticated_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/logout_user_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/sign_in_with_email_and_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/sign_up_with_email_and_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;
  final LogoutUserUseCase logoutUserUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final CheckUserAuthenticatedUseCase checkUserAuthenticatedUseCase;

  AuthenticationBloc(
      {required this.signInWithEmailAndPasswordUseCase,
      required this.signUpWithEmailAndPasswordUseCase,
      required this.logoutUserUseCase,
      required this.resetPasswordUseCase,
      required this.checkUserAuthenticatedUseCase})
      : super(AuthenticationInitialState()) {
    on<AuthenticateUserEvent>(authenticateUser);
    on<SignUpUserEvent>(signUpUser);
    on<CheckUserAuthenticatedEvent>(checkUserAuthenticated);
    on<LogoutUserEvent>(logoutUser);
    on<ResetPasswordEvent>(resetPassword);
  }

  void authenticateUser(
    AuthenticateUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoadingState());

    AuthenticationParams authenticationParams = AuthenticationParams(
      email: event.email,
      password: event.password,
    );

    final response =
        await signInWithEmailAndPasswordUseCase(authenticationParams);

    emit(response.fold((failure) {
      return AuthenticationFailedState(failure is UnexpectedFailure
          ? failure.unexpectedExceptionText
          : null);
    }, (result) {
      return AuthenticationSuccessState();
    }));
  }

  void signUpUser(
    SignUpUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoadingState());

    AuthenticationParams authenticationParams = AuthenticationParams(
      email: event.email,
      password: event.password,
    );

    final response =
        await signUpWithEmailAndPasswordUseCase(authenticationParams);

    emit(response.fold((failure) {
      return AuthenticationFailedState(failure is UnexpectedFailure
          ? failure.unexpectedExceptionText
          : null);
    }, (result) {
      return AuthenticationSuccessState();
    }));
  }

  void logoutUser(
    LogoutUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LogoutLoadingState());

    final response = await logoutUserUseCase();

    emit(response.fold((failure) {
      return LogoutFailedState(failure is UnexpectedFailure
          ? failure.unexpectedExceptionText
          : null);
    }, (result) {
      return LogoutSuccessState();
    }));
  }

  void resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(ResetPasswordLoadingState());

    final response = await resetPasswordUseCase(event.email);

    emit(response.fold((failure) {
      return ResetPasswordFailedState(failure is UnexpectedFailure
          ? failure.unexpectedExceptionText
          : null);
    }, (result) {
      return ResetPasswordSuccessState();
    }));
  }

  void checkUserAuthenticated(
    CheckUserAuthenticatedEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final response = checkUserAuthenticatedUseCase();
    emit(response
        ? AuthenticationSuccessState()
        : const AuthenticationFailedState(null));
  }
}
