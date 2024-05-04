import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/core/network/connection_manager.dart';

class RepositoryMixin {
  final ConnectionManager connectionManager;

  RepositoryMixin({required this.connectionManager});

  Future<Either<Failure, T>> call<T>(
      Future<T> Function()? remoteFunction) async {
    try {
      if (await connectionManager.isConnected() == false) {
        return const Left(NetworkFailure('No connection!'));
      } else {
        if (remoteFunction != null) {
          var result = await remoteFunction();
          return Right(result);
        } else {
          return const Left(UnexpectedFailure('Remote function is null!'));
        }
      }
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
