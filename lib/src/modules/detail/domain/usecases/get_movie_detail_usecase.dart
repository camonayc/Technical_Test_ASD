import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';
import 'package:technical_test_asd/src/modules/detail/domain/repositories/abstract_detail_repository.dart';

class GetMovieDetailUseCase extends UseCase<DetailMovieModel, int> {
  GetMovieDetailUseCase(this._repository);

  final AbstractDetailRepository _repository;

  @override
  Future<Either<Failure, DetailMovieModel>> call(int params) =>
      _repository.getMovieDetail(params);
}
