import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';

abstract class AbstractMoviesRepository {
  Future<Either<Failure, void>> deleteMovie(int id);
}
