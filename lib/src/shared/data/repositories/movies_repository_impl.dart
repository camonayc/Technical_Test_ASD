import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/shared/data/data_sources/local/abstract_movies_local.dart';
import 'package:technical_test_asd/src/shared/domain/repositories/abstract_movies_repository.dart';

class MoviesRepositoryImpl extends AbstractMoviesRepository {
  MoviesRepositoryImpl(
    this._moviesLocal,
  );

  final AbstractMoviesLocal _moviesLocal;

  @override
  Future<Either<Failure, void>> deleteMovie(int id) async {
    try {
      await _moviesLocal.deleteMovie(id);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
