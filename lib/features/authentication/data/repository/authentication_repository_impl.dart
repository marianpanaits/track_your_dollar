import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/core/mixin/repository_mixin.dart';
import 'package:track_your_dollar/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/authentication_params.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final RepositoryMixin repositoryMixin;
  final AuthenticationDatasource authenticationDatasource;

  AuthenticationRepositoryImpl(
      {required this.repositoryMixin, required this.authenticationDatasource});

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      AuthenticationParams params) async {
    return repositoryMixin.call(() async =>
        authenticationDatasource.signUpWithEmailAndPassword(
            email: params.email, password: params.password));
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      AuthenticationParams params) async {
    return repositoryMixin.call(() async =>
        authenticationDatasource.signInWithEmailAndPassword(
            email: params.email, password: params.password));
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    return repositoryMixin.call(() async => authenticationDatasource.signOut());
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) {
    return repositoryMixin
        .call(() async => authenticationDatasource.resetPassword(email: email));
  }

  @override
  bool checkUserAuthenticated() {
    return authenticationDatasource.checkUserAuthenticated();
  }
}
