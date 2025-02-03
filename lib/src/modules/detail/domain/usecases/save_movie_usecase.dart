import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/modules/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class SaveMovieUseCase extends UseCase<void, MovieModel> {
  SaveMovieUseCase(this._repository);

  final AbstractDetailRepository _repository;

  @override
  Future<Either<Failure, void>> call(MovieModel params) =>
      _repository.saveMovie(params);
}
