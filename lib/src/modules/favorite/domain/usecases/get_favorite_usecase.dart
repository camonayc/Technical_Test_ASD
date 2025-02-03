import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/models/get_local_movies_params.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/repositories/abstract_favorite_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class GetFavoriteUseCase
    extends UseCase<List<MovieModel>, GetLocalMoviesParams> {
  GetFavoriteUseCase(this._repository);

  final AbstractFavoriteRepository _repository;

  @override
  Future<Either<Failure, List<MovieModel>>> call(GetLocalMoviesParams params) =>
      _repository.getMovies(params);
}
