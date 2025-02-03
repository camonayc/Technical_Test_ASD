import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/get_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/search_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/repositories/abstract_home_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class HomeRepositoryImpl extends AbstractHomeRepository {
  HomeRepositoryImpl(this._homeApi);

  final AbstractHomeApi _homeApi;

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies(
    GetMoviesParams params,
  ) async {
    try {
      final List<MovieModel> movies = await _homeApi.getMovies(
        page: params.page,
        sortBy: params.sortBy,
      );

      return Right(movies);
    } on Failure catch (e) {
      Logger.error('[HomeRepositoryImpl.getMovies] $e');
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(
    SearchMoviesParams params,
  ) async {
    try {
      final List<MovieModel> movies = await _homeApi.searchMovies(
        query: params.query,
        page: params.page,
      );

      return Right(movies);
    } on Failure catch (e) {
      Logger.error('[HomeRepositoryImpl.searchMovies] $e');
      return Left(e);
    }
  }
}
