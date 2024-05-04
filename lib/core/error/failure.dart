import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String exceptionText;

  const Failure(this.exceptionText);

  @override
  List<Object?> get props => [];
}

class UnexpectedFailure extends Failure {
  final String unexpectedExceptionText;

  const UnexpectedFailure(this.unexpectedExceptionText)
      : super(unexpectedExceptionText);
}

class NetworkFailure extends Failure {
  final String networkExceptionText;

  const NetworkFailure(this.networkExceptionText) : super(networkExceptionText);
}
