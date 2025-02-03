import 'package:technical_test_asd/src/core/utils/failure.dart';

class ErrorFailure extends Failure {
  ErrorFailure({
    this.error,
    this.message,
  });

  factory ErrorFailure.decode(dynamic error) {
    return ErrorFailure(
      error: error,
      message: error.toString(),
    );
  }

  final dynamic error;

  @override
  final String? message;
}
