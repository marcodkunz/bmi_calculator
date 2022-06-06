abstract class Failure {}

class ExceptionFailure extends Failure {
  final dynamic ex;

  ExceptionFailure(this.ex);
}

class EmptyFailure extends Failure {}
