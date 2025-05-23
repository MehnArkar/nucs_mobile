// Core error handling
abstract class Failure {
  final String message;
  const Failure(this.message);
}


class SystemFailure extends Failure {
  const SystemFailure(super.message);
}


class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

