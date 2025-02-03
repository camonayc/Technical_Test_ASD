import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/core/utils/use_case.dart';
import 'package:technical_test_asd/src/modules/detail/domain/repositories/abstract_detail_repository.dart';

class IsFavoriteUseCase extends UseCase<bool, int> {
  IsFavoriteUseCase(this._repository);

  final AbstractDetailRepository _repository;

  @override
  Future<Either<Failure, bool>> call(int params) =>
      _repository.isFavorite(params);
}
