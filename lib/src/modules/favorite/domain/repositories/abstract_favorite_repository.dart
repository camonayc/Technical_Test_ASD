import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/models/get_local_movies_params.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractFavoriteRepository {
  Future<Either<Failure, List<MovieModel>>> getMovies(
      GetLocalMoviesParams params);
}
