import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure({required String message}) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message}) : super(message);
}

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({required String message}) : super(message);
}
