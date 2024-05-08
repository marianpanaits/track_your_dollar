import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/authentication_params.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      AuthenticationParams params);

  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      AuthenticationParams params);

  Future<Either<Failure, void>> logoutUser();

  Future<Either<Failure, void>> resetPassword(String email);

  bool checkUserAuthenticated();
}
