import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';

class ResetPasswordUseCase {
  final AuthenticationRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, void>> call(email) async {
    return await _repository.resetPassword(email);
  }
}
