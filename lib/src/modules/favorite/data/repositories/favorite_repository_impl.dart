import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/favorite/data/data_sources/local/abstract_favorite_local.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/models/get_local_movies_params.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/repositories/abstract_favorite_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class FavoriteRepositoryImpl extends AbstractFavoriteRepository {
  FavoriteRepositoryImpl(this._favoriteLocal);

  final AbstractFavoriteLocal _favoriteLocal;

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies(
      GetLocalMoviesParams params) async {
    try {
      final result = await _favoriteLocal.getMovies(
        params.page,
        pageSize: params.pageSize,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
