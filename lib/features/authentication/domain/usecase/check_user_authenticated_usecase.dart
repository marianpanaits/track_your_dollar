import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';

class CheckUserAuthenticatedUseCase {
  final AuthenticationRepository _repository;

  CheckUserAuthenticatedUseCase(this._repository);

  bool call() {
    return _repository.checkUserAuthenticated();
  }
}
