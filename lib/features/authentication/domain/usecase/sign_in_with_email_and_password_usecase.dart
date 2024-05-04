import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/authentication_params.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthenticationRepository _repository;

  SignInWithEmailAndPasswordUseCase(this._repository);

  Future<Either<Failure, UserCredential>> call(
      AuthenticationParams params) async {
    return await _repository.signInWithEmailAndPassword(params);
  }
}
