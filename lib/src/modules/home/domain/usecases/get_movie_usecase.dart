import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/get_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/repositories/abstract_home_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class GetMovieUsecase extends UseCase<List<MovieModel>, GetMoviesParams> {
  GetMovieUsecase(this._repository);

  final AbstractHomeRepository _repository;

  @override
  Future<Either<Failure, List<MovieModel>>> call(GetMoviesParams params) =>
      _repository.getMovies(params);
}
