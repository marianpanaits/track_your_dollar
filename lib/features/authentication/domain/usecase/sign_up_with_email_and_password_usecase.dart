import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/authentication_params.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthenticationRepository _repository;

  SignUpWithEmailAndPasswordUseCase(this._repository);

  Future<Either<Failure, UserCredential>> call(AuthenticationParams params) {
    return _repository.signUpWithEmailAndPassword(params);
  }
}
