import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
