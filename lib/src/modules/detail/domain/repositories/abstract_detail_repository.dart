import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractDetailRepository {
  Future<Either<Failure, DetailMovieModel>> getMovieDetail(int id);
  Future<Either<Failure, void>> saveMovie(MovieModel movie);
  Future<Either<Failure, bool>> isFavorite(int id);
}
