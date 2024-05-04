import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';

class LogoutUserUseCase {
  final AuthenticationRepository _repository;

  LogoutUserUseCase(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.logoutUser();
  }
}
