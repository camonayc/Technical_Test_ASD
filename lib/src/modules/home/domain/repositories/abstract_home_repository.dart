import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/get_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/search_movies_params.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<MovieModel>>> getMovies(GetMoviesParams params);
  Future<Either<Failure, List<MovieModel>>> searchMovies(
      SearchMoviesParams params);
}
