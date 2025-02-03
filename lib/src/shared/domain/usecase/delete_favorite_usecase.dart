import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/shared/domain/repositories/abstract_movies_repository.dart';

class DeleteFavoriteUseCase extends UseCase<void, int> {
  DeleteFavoriteUseCase(this._repository);

  final AbstractMoviesRepository _repository;

  @override
  Future<Either<Failure, void>> call(int params) =>
      _repository.deleteMovie(params);
}
